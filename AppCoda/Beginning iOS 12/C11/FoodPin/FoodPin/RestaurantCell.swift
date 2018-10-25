//
//  RestaurantCell.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet var thumbnailImageView: UIImageView! {
        
        // 当属性thumbnailImageView被赋值以后，我们就
        // 可以在下面的代码块中设置该控件的圆角
        didSet {
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2.0
            thumbnailImageView.layer.masksToBounds = true
        }
    }
    
    /// 名称
    @IBOutlet var nameLabel: UILabel!
    
    /// 地点
    @IBOutlet var locationLabel: UILabel!
    
    /// 类型
    @IBOutlet var typeLabel: UILabel!
    
    /// cell标记图片
    @IBOutlet var heartImageView: UIImageView!
    
    
    // MARK: - 类自带的方法

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
