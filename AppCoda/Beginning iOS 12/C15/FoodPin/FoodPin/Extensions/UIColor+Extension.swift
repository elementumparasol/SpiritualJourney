//
//  UIColor+Extension.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 根据指定的参数，设置RGBA颜色
    ///
    /// - Parameters:
    ///   - r: 红色颜色通道
    ///   - g: 绿色颜色通道
    ///   - b: 栏色颜色通道
    ///   - alpha: 透明度，默认为不透明
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 生成随机颜色
    ///
    /// - Returns: 返回一个随机颜色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat.random(in: 0..<256), g: CGFloat.random(in: 0..<256), b: CGFloat.random(in: 0..<256))
    }
}

