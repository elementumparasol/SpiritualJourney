//
//  PhotosViewController.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import Photos


class PhotosViewController: UICollectionViewController {
    
    
    // MARK: - 自定义属性
    
    /// photos
    private lazy var photos = PhotosViewController.loadPhotos()
    
    /// imageManager缓存图片资源管理器
    private lazy var imageManager = PHCachingImageManager()
    
    /// thumbnailSize
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
    
    /// 加载照片
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

    // 返回一个分组中有多少个item
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }

    // 返回UICollectionViewCell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 从数组photos中取出assets
        let asset = photos.object(at: indexPath.item)
        
        // 根据标识符取出cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCell
    
        // Configure the cell
        cell.representedAssetIdentifier = asset.localIdentifier
        imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil) { (image, _) in
            
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.imageView.image = image
            }
        }
    
        return cell
    }

    
    // MARK: UICollectionViewDelegate
    
    // 选择某个item时调用
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 获取asset
        let asset = photos.object(at: indexPath.item)
        
        // 选中cell时，给cell添加动画
        if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell {
            cell.flash()
        }
        
        // 通过缓存图片资源管理器，请求指定的图片资源
        imageManager.requestImage(for: asset, targetSize: view.frame.size, contentMode: .aspectFill, options: nil) { [weak self] (image, info) in
            
            // 对image和info进行校验
            guard let image = image, let info = info else {
                return
            }
        }
        
        
    }

    
    

}
