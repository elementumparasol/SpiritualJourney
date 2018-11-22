//
//  PHPhotoLibrary+Rx.swift
//  Collages
//
//  Created by Enrica on 2018/11/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension PHPhotoLibrary {
    
    /// 请求相册权限
    static var authorized: Observable<Bool> {
        
        // 创建并返回一个Observable
        return Observable.create({ (observer) -> Disposable in
            
            DispatchQueue.main.async {
                
                if authorizationStatus() == .authorized {
                    observer.onNext(true)
                    observer.onCompleted()
                } else {
                    observer.onNext(false)
                    
                    // 请求用户允许访问系统相册
                    requestAuthorization({ (newStatus) in
                        observer.onNext(newStatus == .authorized)
                        observer.onCompleted()
                    })
                }
            }
            
            // 返回一个空的Observable
            return Disposables.create()
        })
    }
}
