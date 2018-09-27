//
//  PhotoCell.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - 自定义属性
    
    ///
    var representedAssetIdentifier: String!
    
    
    // MARK: - 类自带的方法
    
    // 在cell准备循环利用时调用，一般用来做一些清理工作
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 清空imageView上面的数据
        imageView.image = nil
    }
    
    
    // MARK: - 自定义方法
    
    /// 给图片添加动画
    func flash() {
        
        imageView.alpha = 0
        setNeedsDisplay()
        
        // 添加UIView动画
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.imageView.alpha = 1
        })
    }
    
}
