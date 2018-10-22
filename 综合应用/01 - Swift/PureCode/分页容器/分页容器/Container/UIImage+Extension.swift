//
//  UIImage+Extension.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * UIImage的扩展方法
 */

import UIKit

extension UIImage {
    
    /// 给定一张图片，对其进行保护性拉伸
    ///
    /// - Parameter imageName: 指定图片的名称
    /// - Returns: 返回一张受保护，并且经过拉伸的图片
    class func resizableImage(with imageName: String) -> UIImage {
        
        // 对图片进行校验(图片名称错误，或者图片根本就不存在)
        guard let image = UIImage(named: imageName) else {
            print("图片: \(imageName)拼写有误，或者图片不存在!")
            fatalError("图片加载失败，请检查!")
        }
        
        // 获取原始图片的尺寸
        let imageSize = image.size
        
        // 返回一张新的，受保护的拉伸图片
        return image.resizableImage(withCapInsets: UIEdgeInsets(top: imageSize.height * 0.5, left: imageSize.width * 0.5, bottom: imageSize.height * 0.5 - 1, right: imageSize.width * 0.5 - 1))
    }
}
