//
//  UserInputAlert.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/2.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


/// 以AlertController的形式弹出一个输入框
///
/// - Parameters:
///   - title: alertController的标题
///   - isSecure: 标识文本对象是否应禁用文本复制，并在某些情况下隐藏正在输入的文本
///   - text: 待办事项的文字描述
///   - callback: 闭包回调
func userInputAlert(_ title: String, isSecure: Bool = false, text: String? = nil, callback: @escaping (String) -> Void) {
    
    // 创建alertController
    let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
    
    // 在alert中添加一个textField
    alert.addTextField(configurationHandler: { field in
        
        field.isSecureTextEntry = isSecure
        field.text = text
    })
    
    // 添加alertAction
    alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
        
        guard let text = alert.textFields?.first?.text, !text.isEmpty else {
            userInputAlert(title, callback: callback)
            return
        }
        
        callback(text)
    })
    
    // 获取rootViewController
    let root = UIApplication.shared.keyWindow?.rootViewController
    
    // 显示alertController
    root?.present(alert, animated: true, completion: nil)
}
