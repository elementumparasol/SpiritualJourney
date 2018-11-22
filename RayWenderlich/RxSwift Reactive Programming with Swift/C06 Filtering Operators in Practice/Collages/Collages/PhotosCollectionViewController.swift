//
//  PhotosCollectionViewController.swift
//  Collages
//
//  Created by Enrica on 2018/11/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import Photos
import RxSwift

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
    
    
    // 点击并相册中的图片(使用PublishSubject来添加.next事件)
    private let selectedPhotosSubject = PublishSubject<UIImage>()
    var selectedPhotos: Observable<UIImage> {
        return selectedPhotosSubject.asObserver()
    }
    
    /// 用于管理订阅内存
    private let disposeBag = DisposeBag()
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通过share()获取Observable
        let authorized = PHPhotoLibrary.authorized.share()
        
        // 订阅Observable
        authorized
            .skipWhile({ $0 == false })  // 如果未授权，则跳过不订阅
            .take(1)  // 如果获得用户授权，则第一个事件元素(其实只有一个)
            .subscribe(onNext: { [weak self] _ in
                
                // 加载相册中的图片
                self?.photos = PhotosCollectionViewController
                    .loadPhotos()
                
                // 回到主线程中去刷新UI
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }).disposed(by: disposeBag)
        
        // 处理用户未授权访问相册的情况
        authorized
            .skip(1)
            .takeLast(1)
            .filter({ $0 == false })
            .subscribe(onNext: { [weak self] _ in
                guard let errorMessage = self?.errorMessage else { return }
                
                // 回到主线程中执行errorMessage方法
                DispatchQueue.main.async(execute: errorMessage)
            }).disposed(by: disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 添加一个.completed事件以结束订阅
        selectedPhotosSubject.onCompleted()
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
    
    /// 弹出错误提示
    private func errorMessage() {
        
        // 弹出alert提示
        alert(title: "No access to Camera Roll", message: "You can grant access to Collage from the Settings app")
            .subscribe(onCompleted: { [weak self] in
                
                // 移除alert提示
                self?.dismiss(animated: true, completion: nil)
                
                // 返回上一级界面
                _ = self?.navigationController?
                    .popViewController(animated: true)
            }).disposed(by: disposeBag)
    }
    

    // MARK: - UICollectionViewDataSource

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

    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 取出cell
        if let cell = collectionView
            .cellForItem(at: indexPath) as? PhotoCollectionViewCell {
            
            // 添加cell闪烁动画
            cell.flash()
        }
        
        // 获取相册中图片所表示的asset
        let asset = photos.object(at: indexPath.item)
        
        // 从相册中选择照片
        imageManager.requestImage(for: asset, targetSize: view.frame.size, contentMode: .aspectFill, options: nil) { [weak self] (image, info) in
            
            // 对image和info进行校验
            guard let image = image, let info = info else { return }
            
            // 检查image是缩略图还是完整的asset
            if let isThumbnail = info[PHImageResultIsDegradedKey as NSString] as? Bool, !isThumbnail {
                
                // 将图片添加到selectedPhotosSubject
                self?.selectedPhotosSubject.onNext(image)
            }
        }
    }
}
