//
//  PhotoWriter.swift
//  Collages
//
//  Created by Enrica on 2018/11/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import Photos
import RxSwift

class PhotoWriter {
    
    /// 发生错误
    enum MyError: Error {
        
        // 无法保存图片
        case couldNotSavePhoto
    }
    
    /// 将图片保存到系统相册
    ///
    /// - Parameter image: 需要保存的图片
    /// - Returns: 新创建asset的专用标识符
    static func save(_ image: UIImage) -> Observable<String> {
        
        // 创建一个Observable并将其返回
        return Observable.create({ (observer) -> Disposable in
            
            // 用于保存asset的identifier
            var savedAssetId: String?
            
            // 将照片保存到系统照片库中(默认是异步执行)
            PHPhotoLibrary.shared().performChanges({
                
                // 根据传入的图片来创建相应的图片资源
                let request = PHAssetChangeRequest
                    .creationRequestForAsset(from: image)
                
                // 为新创建的图片资源创建唯一的标识符
                savedAssetId = request.placeholderForCreatedAsset?
                    .localIdentifier
            }, completionHandler: { (isSuccess, error) in
                
                // 发出assetId或者.error
                DispatchQueue.main.async {
                    
                    // 如果图片的asset创建成功，则将它添加到
                    // Observable中; 否则就添加.error事件
                    if isSuccess, let id = savedAssetId {
                        observer.onNext(id)
                        observer.onCompleted()
                    } else {
                        observer
                            .onError(error ?? MyError.couldNotSavePhoto)
                    }
                }
            })
            
            // 返回一个Observable
            return Disposables.create()
        })
    }
}
