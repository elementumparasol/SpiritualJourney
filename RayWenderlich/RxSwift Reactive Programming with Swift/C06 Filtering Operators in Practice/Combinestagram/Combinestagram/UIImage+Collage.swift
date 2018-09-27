//
//  UIImage+Collage.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


extension UIImage {
    
    
    /// 根据给定的图片和尺寸品贴出一张新图片
    ///
    /// - Parameters:
    ///   - images: 指定的图片
    ///   - size: 指定的尺寸
    /// - Returns: 返回一张新的拼贴图
    static func collage(images: [UIImage], size: CGSize) -> UIImage {
        
        // 拼贴图片的行数。如果图片的数量小于3，则只需使用
        // 一行；如果图片的数量不小于3，则使用两行
        let rows = images.count < 3 ? 1 : 2
        
        // 拼贴图片的列数
        let columns = Int(round(Double(images.count) / Double(rows)))
        
        // 计算拼贴图片的size
        let tileSize = CGSize(width: round(size.width / CGFloat(columns)),
                              height: round(size.height / CGFloat(rows)))
        
        // 开启一个基于位图的图形上下文
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        
        // setFill()方法相当于一个颜色接收器，我们用它来接收指定的颜色，
        // 以便用于后续的填充操作
        UIColor.white.setFill()
        
        // 使用当前的颜色来填充指定的区域
        UIRectFill(CGRect(origin: .zero, size: size))
        
        // 遍历图片数组images，取出里面的所有图片
        for (index, image) in images.enumerated() {
            
            // 按照计算好了的尺寸，对图片进行缩放
            image.scaled(tileSize)
                
                // 按照指定的点，在当前图形上下文中绘制图片
                .draw(at: CGPoint(
                x: CGFloat(index % columns) * tileSize.width,
                y: CGFloat(index / columns) * tileSize.height
            ))
        }
        
        // 从当前的基于位图的图形上下文中返回一张图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭这个基于位图的图形上下文
        UIGraphicsEndImageContext()
        
        // 返回image。如果image不存在，则返回一张占位图片
        return image ?? UIImage()
    }
    
    
    /// 按照给定的尺寸，对图片进行缩放
    ///
    /// - Parameter newSize: 图片新的尺寸
    /// - Returns: 返回一张经过缩放之后的图片
    func scaled(_ newSize: CGSize) -> UIImage {
        
        // 对指定的尺寸进行校验，如果不需要缩放，则直接返回原始图片
        guard size != newSize else {
            return self
        }
        
        // 计算缩放比率
        let ratio = max(newSize.width / size.width, newSize.height / size.height)
        
        // 新图片的宽度
        let width = size.width * ratio
        
        // 新图片的高度
        let height = size.height * ratio
        
        // 计算新图片的Rect
        let scaledRect = CGRect(
            x: (newSize.width - width) / 2.0,
            y: (newSize.height - height) / 2.0,
            width: width, height: height)
        
        // 根据指定的参数，开启一个基于位图的图形上下文
        UIGraphicsBeginImageContextWithOptions(scaledRect.size, false, 0.0)
        
        // defer是一个用于延迟执行的关键字
        // 它一般在函数结束之后才会被调用。放在
        // 我们这里，也就是等到新的图片返回之后才会执行
        defer {
            
            // 从图形上下文栈顶移除当前基于位图的图形上下文
            UIGraphicsEndImageContext()
        }
        
        // 开始绘图
        draw(in: scaledRect)
        
        // 从当前基于位图的图形上下文中返回一张图片
        // 如果这样的图片不存在，则返回一张默认的图片
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
    
    
}
