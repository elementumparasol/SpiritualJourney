//
//  PhotoWriter.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import Photos
import RxSwift


class PhotoWriter {
    
    /// 自定义一个错误枚举常量
    enum MyError: Error {
        
        /// 无法保存照片
        case couldNotSavePhoto
    }
    
    /// 保存图片
    static func save(_ image: UIImage) -> Observable<String> {
        
        return Observable.create({ (observer) -> Disposable in
            
            // 用于保存相册photo asset的id
            var saveAssetId: String?
            
            // 保存照片到相册
            PHPhotoLibrary.shared().performChanges({
                
                // 创建新的photo asset
                let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
                
                // 将这个新创建的photo asset的id保存到saveAssetId中
                saveAssetId = request.placeholderForCreatedAsset?.localIdentifier
                
            }, completionHandler: { (success, error) in
                
                // 回到主线程去执行下列代码
                DispatchQueue.main.async {
                    if success, let id = saveAssetId {
                        observer.onNext(id)
                        observer.onCompleted()
                    } else {
                        observer.onError(error ?? MyError.couldNotSavePhoto)
                    }
                }
                
            })
            
            // 所有的事件执行完毕，返回一个disposable
            return Disposables.create()
        })
    }
    
}
