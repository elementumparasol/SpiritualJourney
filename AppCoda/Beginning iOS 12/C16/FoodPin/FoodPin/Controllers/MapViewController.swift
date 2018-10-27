//
//  MapViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/27.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    // MARK: - @IBOutlet
    
    /// mapView控件
    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK: - 自定义属性
    
    /// 用于存储餐厅模型数据(控制器跳转时会被传递过来)
    var restaurant = Restaurant()  // var restaurant: Restaurant!
    
    
    // MARK: - 类自带的属性
    
    // 自定义状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()

        // 修改导航条的tintColor
        navigationController?.navigationBar.tintColor = .black
        
        // 在地图上面显示大头针标记
        showAnnotationsOnMap()
    }
    
    
    // MARK: - 自定义方法
    
    /// 将地理位置的文本描述转换为地图上面的大头针
    private func showAnnotationsOnMap() {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                // 设置大头针标记的标题
                annotation.title = self.restaurant.name
                
                // 设置大头针标记的子标题(点击大头针时会显示)
                annotation.subtitle = self.restaurant.type
                
                // 获取placemark中的经纬度信息
                if let location = placemark.location {
                    
                    // 将annotation转换为经纬度坐标
                    annotation.coordinate = location.coordinate
                    
                    // 在地图上显示大头针标记。这个方法非常的智能，它无需
                    // 我们再手动添加缩放级别代码，会自动缩放到合适的大小
                    self.mapView.showAnnotations([annotation], animated: true)
                    
                    // 进入地图时就让大头针处于被选中状态(也就是放大状态)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
        
        
    }
    
    
    
    

}
