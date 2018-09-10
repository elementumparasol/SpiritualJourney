//
//  UIImage+Resize.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/9.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 返回一张经过压缩了新图片
    func resize(withBounds bounds: CGSize) -> UIImage {
        
        // 计算压缩比率
        let horizontalRatio = bounds.width / size.width
        let verticalRatio = bounds.height / size.height
        let ratio = min(horizontalRatio, verticalRatio)
        
        // 计算新突破的size
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        // 使用指定的图片尺寸和缩放比率，创建基于位图的图形上下文
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        
        // 根据指定的需求(尺寸和缩放比率)绘制整个图像
        draw(in: CGRect(origin: .zero, size: newSize))
        
        // 从当前位图的图形上下文中返回根据需求绘制好了的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 从堆栈顶部删除当前基于位图的图形上下文
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
