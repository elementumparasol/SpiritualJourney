//
//  UIColor-Extension.swift
//  控制器转场动画
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    /// 自定义RGBA颜色
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
    
    
    /// 返回一个随机颜色
    ///
    /// - Returns: 随机颜色
    class func randomColor() -> UIColor {
        
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}


