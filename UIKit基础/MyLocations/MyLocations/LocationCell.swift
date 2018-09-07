//
//  LocationCell.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/7.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// descriptionLabel
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// addressLabel
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    
    
    // MARK: - 类自带的方法

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - 自定义方法
    
    /// 配置cell相关的信息(给cell上面的label设置数据)
    func configure(for location: Location) {
        
        // 设置descriptionLabel上面的文字
        if location.locationDescription.isEmpty {
            descriptionLabel.text = "(No Description)"
        } else {
            descriptionLabel.text = location.locationDescription
        }
        
        // 如果placemark有值
        if let placemark = location.placemark {
            
            var text = ""
            
            // 城市信息
            if let s = placemark.locality {
                text += s + " "
            }
            
            // 街道信息
            if let s = placemark.thoroughfare {
                text += s + " "
            }
            
            // 详细的街道信息
            if let s = placemark.subThoroughfare {
                text += s + " "
            }
            
            // 设置addressLabel上面的文字
            addressLabel.text = text
        } else {
            
            // 如果placemark没有值，就设置经纬度信息
            addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
        }
    }
    
    
    
    
    

}
