//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {
    
    // MARK: - @IBOutlet
    
    /// 餐厅图片
    @IBOutlet weak var headerImageView: UIImageView!
    
    /// 餐厅名称
    @IBOutlet weak var nameLabel: UILabel! {
        
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    
    /// 餐厅类型
    @IBOutlet weak var typeLabel: UILabel! {
        
        didSet {
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true

        }
    }
    
    /// 餐厅标记图片
    @IBOutlet weak var heartImageView: UIImageView! {
        
        didSet {
            
            // 指定图片的渲染模式为alwaysTemplate
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            
            // 修改图片的tintColor
            heartImageView.tintColor = .white
        }
    }

}
