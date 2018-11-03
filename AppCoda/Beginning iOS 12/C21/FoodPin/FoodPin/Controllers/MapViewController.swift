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
    var restaurant: RestaurantMO!
    
    
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
        
        // 让当前控制器成为mapView的代理
        mapView.delegate = self
        
        // 显示交通信息
        mapView.showsTraffic = true
        
        // 显示缩放比例尺(地图缩放时显示)
        mapView.showsScale = true
        
        // 显示指南针(地图旋转时显示)
        mapView.showsCompass = true
    }
    
    deinit {
        print("MapViewController --- 被销毁了")
    }
    
    
    // MARK: - 自定义方法
    
    /// 将地理位置的文本描述转换为地图上面的大头针
    private func showAnnotationsOnMap() {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location ?? "") { (placemarks, error) in
            
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


// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    // 自定义mapView上面annotation的外观
    // 每次在地图上面显示annotation时都会调用这个方法
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // 设置annotationView的可重用标识符
        let identifier = "MyMarker"
        
        // MKUserLocation反映的使用户当前自动定位的位置，并不是用户
        // 标记的位置，我们只需要自定义用户标记的位置
        if annotation.isKind(of: MKUserLocation.self) { return nil }
        
        // 根据可重用标识符取出annotationView
        var annotationView: MKMarkerAnnotationView? = mapView
        .dequeueReusableAnnotationView(withIdentifier: identifier)
        as? MKMarkerAnnotationView
        
        // 如果annotationView为空，则创建新的annotationView
        // 并且给它绑定可重用标识符
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        // 设置annotationView气球上面的文字
        annotationView?.glyphText = "🐶"
        
        // 设置annotationView的背景颜色
        annotationView?.markerTintColor = .green
        
        // 设置annotationView气球中的图片
        // annotationView?.glyphImage = UIImage(named: "heart-tick")
        
        return annotationView
    }
    
    
}
