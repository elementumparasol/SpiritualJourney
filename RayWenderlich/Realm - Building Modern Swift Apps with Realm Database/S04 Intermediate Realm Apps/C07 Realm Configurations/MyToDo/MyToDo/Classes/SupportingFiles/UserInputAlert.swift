//
//  UserInputAlert.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

/// 以AlertController的形式弹出一个用户输入框
///
/// - Parameters:
///   - title: 用户输入的内容
///   - isSecure: 是否需要禁用复制功能并且将文本隐藏
///   - completion: 代码完成以后的回调
func userInputAlert(_ title: String, isSecure: Bool = false, completion: @escaping (String) -> Void) {
    
    // 创建一个alert控制器
    let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
    
    // 在alert控制器上面添加一个textField控件
    alertController.addTextField { (textField) in
        
        // isSecureTextEntry用于标识是否应该禁用
        // 文本复制，并且在某些情况下是否应该隐藏文本
        textField.isSecureTextEntry = isSecure
    }
    
    // 在alert控制器上面添加action
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
        
        guard let text = alertController.textFields?.first?.text,
            !text.isEmpty else {
                userInputAlert(title, completion: completion)
                return
        }
        
        completion(text)
    }))
    
    // 获取rootViewController
    let rootViewController = UIApplication.shared.keyWindow?.rootViewController
    
    // 显示alertController
    rootViewController?.present(alertController, animated: true, completion: nil)
}
