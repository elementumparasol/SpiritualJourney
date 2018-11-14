//
//  PhotosCollectionViewController.swift
//  Collages
//
//  Created by Enrica on 2018/11/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import Photos

/// UICollectionViewCell的可重用标识符
private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - 自定义属性
    
    /// 加载相册中的照片资源
    private lazy var photos = PhotosCollectionViewController.loadPhotos()
    
    /// imageManager缓存图片资源管理器
    private lazy var imageManager = PHCachingImageManager()
    
    /// UICollectionViewCell的itemSize
    private lazy var thumbnailSize: CGSize = {
        
        // 设置cell的size(通过流水布局来获取)
        let cellSize = (self.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        
        // 返回thumbnail的尺寸
        return CGSize(width: cellSize.width * UIScreen.main.scale,
                      height: cellSize.height * UIScreen.main.scale)
    }()
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    
    // MARK: - 自定义方法
    
    
    /// 加载系统相册中的资源(照片，视频)
    ///
    /// - Returns: 从相册中返回的资源
    static func loadPhotos() -> PHFetchResult<PHAsset> {
        
        // PHFetchOptions是用来获取相册资源的参数，比如说过滤、排序
        // 和管理获取结果等
        let allPhotosOptions = PHFetchOptions()
        
        // sortDescriptors表示用来描述排序的一个列表，这个
        // 列表是用来指定相册获取结果如何排序的
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        // PHAsset: 它表示照片库中的图像、视频或实时照片这些对象
        // fetchAssets(with: ): 这个方法用来检索与指定选项相匹
        // 配的所有PHAsset
        return PHAsset.fetchAssets(with: allPhotosOptions)
    }
    

    // MARK: UICollectionViewDataSource

    /// 返回每一组中UICollectionViewCell的个数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }

    /// 返回UICollectionViewCell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 根据可重用标识符取出cell
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        // 根据指定的索引从photos中取出asset
        let asset = photos.object(at: indexPath.item)
    
        // 取出照片对应的标识符
        cell.representedAssetIdentifier = asset.localIdentifier
        
        // 通过imageManage来请求指定的图片资源
        imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil) { (image, _) in
            
            // 因为我们声明representedAssetIdentifier为
            // 可选类型，所以这里需要做可选绑定
            if cell.representedAssetIdentifier == asset.localIdentifier {
                
                // 设置cell的图片
                cell.cellImageView.image = image
            }
        }
    
        return cell
    }

    

}
