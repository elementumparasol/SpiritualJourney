//
//  UIImage-Extension.swift
//  控制器转场动画
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// 对指定的图片进行保护拉伸
    ///
    /// - Parameter imageName: 图片的名称
    /// - Returns: 如果图片加载成功，则返回一张经过保护的拉伸图片；如果图片加载失败，则返回nil
    class func imageWithStretchalbe(_ imageName: String) -> UIImage? {
        
        // 加载原始图片
        guard let image = UIImage(named: imageName) else { return nil }
        
        // 获取原始图片的size
        let imageSize = image.size
        
        // 对原始图片进行保护拉伸并返回
        return image.resizableImage(withCapInsets: UIEdgeInsets(top: imageSize.height * 0.5, left: imageSize.width * 0.5, bottom: imageSize.height * 0.5 - 1, right: imageSize.width * 0.5 - 1), resizingMode: UIImage.ResizingMode.stretch)
    }
    
    
    /// 返回一张未经编译器渲染的原始图片
    ///
    /// - Parameter imageName: 图片的名称
    /// - Returns: 如果图片加载成功，则返回一张未经渲染的原始图片；如果图片加载失败，则返回nil
    class func imageWithOriginal(_ imageName: String) -> UIImage? {
        
        // 加载原始图片
        guard let image = UIImage(named: imageName) else { return nil }
        
        // 返回一张原始图片
        return image.withRenderingMode(.alwaysOriginal)
    }
}
