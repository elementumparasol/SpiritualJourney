//
//  UIViewController+Rx.swift
//  Collages
//
//  Created by Enrica on 2018/11/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
    
    func alert(title: String, message: String?) -> Completable {
        
        // 返回Completable
        return Completable.create { [weak self] completable in
            
            // 创建UIAlertController对象
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            // 创建UIAlertAction对象，并且将其添加到alertVC中
            alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: {_ in
                completable(.completed)
            }))
            
            // 显示alertVC
            self?.present(alertVC, animated: true, completion: nil)
            
            // 返回一个disposable
            return Disposables.create {
                
                // 移除alertVC
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
