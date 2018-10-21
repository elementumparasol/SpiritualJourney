//
//  UIImage+Extension.swift
//  HimalayanFM
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 给定一张图片，然后对其进行保护性拉伸
    ///
    /// - Parameter imageName: 图片的名称
    /// - Returns: 返回一张经过保护性拉伸之后的图片
    class func resizableImage(with imageName: String) -> UIImage {
        
        // 加载原始图片
        guard let image = UIImage(named: imageName) else {
            fatalError("图片名称拼写错误!")
        }
        
        // 获取原始图片的size
        let imageSize = image.size
        
        // 对原始图片进行拉伸，并且将拉伸之后的图片返回
        return image.resizableImage(withCapInsets: UIEdgeInsets(top: imageSize.height * 0.5, left: imageSize.width * 0.5, bottom: imageSize.height * 0.5 - 1, right: imageSize.width * 0.5 - 1))
    }
    
    /// 保留图片的原始样式(未经过编译器渲染的图片)
    ///
    /// - Parameter imageName: 给定图片的名称
    /// - Returns: 返回一张未经过编译器渲染的原始图片
    class func originalImage(with imageName: String) -> UIImage {
        
        // 加载原始图片
        guard let image = UIImage(named: imageName) else {
            fatalError("图片名称拼写错误!")
        }
        
        // 返回原始图片
        return image.withRenderingMode(.alwaysOriginal)
    }
}
