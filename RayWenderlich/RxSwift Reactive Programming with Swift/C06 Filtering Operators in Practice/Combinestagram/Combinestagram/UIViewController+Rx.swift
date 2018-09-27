//
//  UIViewController+Rx.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxSwift


extension UIViewController {
    
    /// 弹出alert控制器
    func alert(title: String, text: String?) -> Completable {
        
        return Completable.create(subscribe: { [weak self] (completable) -> Disposable in
            
            // 创建alert控制器
            let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
            
            // 创建action
            let action = UIAlertAction(title: "关闭", style: .default, handler: { (_) in
                completable(.completed)
            })
            
            // 将action添加到alert控制器中
            alertVC.addAction(action)
            
            // 弹出alert控制器
            self?.present(alertVC, animated: true, completion: nil)
            
            return Disposables.create {
                
                // 退出alert控制器
                self?.dismiss(animated: true, completion: nil)
            }
            
        })
    }
}
