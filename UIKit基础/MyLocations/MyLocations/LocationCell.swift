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
    
    /// photoImageView
    @IBOutlet weak var photoImageView: UIImageView!
    
    
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
            descriptionLabel.text = "(没有描述信息)"
        } else {
            descriptionLabel.text = location.locationDescription
        }
        
        // 如果placemark有值，就给地址label设置数据
        if let placemark = location.placemark {
            
            var text = ""
            
            // 城市信息
            text.add(text: placemark.locality, separatedBy: " ")
            
            // 街道信息(什么路)
            text.add(text: placemark.thoroughfare, separatedBy: " ")
            
            // 详细的街道信息(多少号)
            text.add(text: placemark.subThoroughfare, separatedBy: " ")
            
            // 设置addressLabel上面的文字
            addressLabel.text = text
        } else {
            
            // 如果placemark没有值，就设置经纬度信息
            addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
        }
        
        // 给photoImageView设置图片
        photoImageView.image = thumbnail(for: location)
    }
    
    /// 在cell左边显示缩略图
    func thumbnail(for location: Location) -> UIImage {
        
        // 如果location实例中有一张图片，则将其返回
        if location.hasPhoto, let image = location.photoImage {
            
            // 返回一张经过压缩之后的图片
            return image.resize(withBounds: CGSize(width: 52, height: 52))
        }
        
        // 如果location里面没有图片，则显示一张占位图片
        return UIImage()
    }
    
    

}
