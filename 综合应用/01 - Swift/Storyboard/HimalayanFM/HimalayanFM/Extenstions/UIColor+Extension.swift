//
//  UIColor+Extension.swift
//  HimalayanFM
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 设置RGBA颜色
    ///
    /// - Parameters:
    ///   - r: red颜色通道值
    ///   - g: green颜色通道值
    ///   - b: blue颜色通导致
    ///   - alpha: alpha透明度
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        
        // 调用UIColor自带的构造方法
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 自定义随机颜色
    ///
    /// - Returns: 返回随机颜色
    class func randomColor() -> UIColor {
        
        // 调用上面的便利构造方法返回随机颜色
        return UIColor(r: CGFloat.random(in: 0..<256), g: CGFloat.random(in: 0..<256), b: CGFloat.random(in: 0..<256))
    }
}
