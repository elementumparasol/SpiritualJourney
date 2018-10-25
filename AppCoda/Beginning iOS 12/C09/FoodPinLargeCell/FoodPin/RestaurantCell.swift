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
    @IBOutlet var thumbnailImageView: UIImageView!
    
    /// 名称
    @IBOutlet var nameLabel: UILabel!
    
    /// 地点
    @IBOutlet var locationLabel: UILabel!
    
    /// 类型
    @IBOutlet var typeLabel: UILabel!
    
    
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
