//
//  PhotosViewController.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import Photos
import RxSwift


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
    
    /// 当我们选中一张图片时，通过observer将其传递给上一级控制器
    /// PublishSubject用于显示所选的照片，但是我们又不能让它被
    /// 其它类访问，所以要将其设置为private，然后通过其它属性提供
    /// 访问接口
    private let selectedPhotoSubject = PublishSubject<UIImage>()
    
    /// 提供外界访问PublishSubject的接口
    var selectedPhotos: Observable<UIImage> {
        return selectedPhotoSubject.asObserver()
    }
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        // 当照片选择完成时，告诉selectedPhotoSubject
        // 事件已经完成了，可以不需要再订阅了，可以释放内存
        selectedPhotoSubject.onCompleted()
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
            
            // 给cell添加选中动画
            cell.flash()
        }
        
        // 通过缓存图片资源管理器，请求指定的图片资源
        imageManager.requestImage(for: asset, targetSize: view.frame.size, contentMode: .aspectFill, options: nil) { [weak self] (image, info) in
            
            // 对image和info进行校验
            guard let image = image, let info = info else {
                return
            }
            
            // 使用info字典来检查图片image是缩略图thumbnail还是完整的asset
            // 如果image图片是完整的asset，则进入代码块中执行下一个步骤
            if let isThumbnail = info[PHImageResultIsDegradedKey as NSString] as? Bool, !isThumbnail {
                
                // 如果是完整的image，则调用onNext(_ :)方法，将image传递进去
                self?.selectedPhotoSubject.onNext(image)
            }
        }
        
        
    }

    
    

}
