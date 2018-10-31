//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/27.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// mapView
    @IBOutlet weak var mapView: MKMapView!

    
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
    
    /// 通过前向地理编码将文本地址转换为地图上面的地理标记
    ///
    /// - Parameter location: 使用文本进行描述的地理位置
    func configure(location: String) {
        
        // CLGeocoder这个类可以帮助我们将文本描述的地理位置
        // 也就是placemark转换为地理坐标。如果要使用前向地理
        // 编码技术，只需要使用CLGeocoder来创建一个实例，然
        // 后在通过这个实例调用
        // geocodeAddressString(_ : , completionHandler:)
        // 方法就可以了。然后我们在这个方法的闭包中对placemark
        // 数据进行处理，最后再将其显示到mapView上面
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            
            // 如果发生错误，那么就打印相关信息，并且返回
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // 对返回的placemarks数据进行校验
            if let placemarks = placemarks {
                
                // 获取所有返回的placemark数据中的第一个
                // 在多数情况下，placemarks数组中只会包含
                // 一个条目，只有在地理位置的文本描述不够精
                // 确的时候才会包含多个，因此，我们取第一个就好
                let placemark = placemarks[0]
                
                // 创建annotation实例对象
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    
                    // 将placemark中包含的位置信息转换为地理坐标
                    annotation.coordinate = location.coordinate
                    
                    // 通过地理坐标来添加annotation标记
                    self.mapView.addAnnotation(annotation)
                    
                    // 设置地图的出事缩放级别(250m级)
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: true)
                }
            }
            
        }
    }
    
    

}
