//
//  PhotoCollectionViewCell.swift
//  Collages
//
//  Created by Enrica on 2018/11/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - 自定义属性
    
    /// 照片在相册中的标识符
    var representedAssetIdentifier: String!
    
    // MARK: - @IBOutlet
    
    /// cellImageView
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    // MARK: - 类自带的方法
    
    // 为了防止cell在循环利用时出现数据错误
    // 在下次使用之前先清除上一次的数据
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 清除图片
        cellImageView.image = nil
    }
    
    
    // MARK: - 自定义动画
    
    /// 闪烁动画
    func flash() {
        
        cellImageView.alpha = 0
        setNeedsDisplay()
        
        UIView.animate(withDuration: 0.5) {
            self.cellImageView.alpha = 1.0
        }
    }
}
