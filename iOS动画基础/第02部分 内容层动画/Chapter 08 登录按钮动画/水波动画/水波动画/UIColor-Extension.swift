//
//  UIColor-Extension.swift
//  水波动画
//
//  Created by Enrica on 2018/7/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 扩充一个生成随机颜色的便利构造函数
    ///
    /// - Parameters:
    ///   - r: 红色通道的值
    ///   - g: 绿色通道的值
    ///   - b: 蓝色通道的值
    ///   - alpha: 透明度
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        
        // 调用自己的指定构造函数
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    
    /// 扩展一个静态方法(类方法), 用于生成随机颜色
    ///
    /// - Returns: 返回随机颜色
    class func randomColor() -> UIColor {
        
        // 返回一个随机颜色
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}

/**
 * 给现有类型扩展构造函数时，只能扩展便利构造函数，不能扩展指定构造函数
 */
