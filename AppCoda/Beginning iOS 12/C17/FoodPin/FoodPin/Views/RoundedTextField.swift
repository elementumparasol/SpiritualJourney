//
//  RoundedTextField.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/29.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {

    // 创建内边距
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    // 返回textField的形状和大小
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // 返回textField占位文字区域的形状和大小
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // 返回textField编辑区域的形状和大小
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // layoutSubviews一般是用来重新布局子控件的
    // 这里主要是用来绘制textField的圆角形状
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
    }

}
