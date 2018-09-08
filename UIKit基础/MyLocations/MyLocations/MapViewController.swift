//
//  MapViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/8.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// mapView
    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK: - 自定义属性
    
    /// managedObjectContext
    var managedObjectContext: NSManagedObjectContext!
    
    /// 保存用户位置信息
    var locations = [Location]()
    
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 取出用户保存的位置信息，然后将其展示在mapView上面
        updateLocations()
        
        if !locations.isEmpty {
            showLocations()
        }
    }
    
    // 执行segue的时候调用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 判断是否为指定的标识符
        if segue.identifier == "EditLocation" {
            
            // 根据指定的标识符，取出与之对应的控制器
            let controller = segue.destination as! LocationDetailsViewController
            
            // 将managedObjectContext传递到指定控制器中的managedObjectContext
            controller.managedObjectContext = managedObjectContext
            
            // 取出按钮
            let button = sender as! UIButton
            
            // 根据按钮的tag取出对应的location
            let location = locations[button.tag]
            
            // 将location赋值给控制器的locaitonToEdit
            controller.locaitonToEdit = location
        }
    }
    
    
    // MARK: - @IBAction
    
    /// 显示用户地理位置
    @IBAction func showUser() {
        
        // 指定区域范围(以用户为中心，1000X1000的范围)
        let regon = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        // 设置显示区域
        mapView.setRegion(mapView.regionThatFits(regon), animated: true)
    }
    
    /// 显示用户保存的所有位置信息
    @IBAction func showLocations() {
        
        // 调用region(for: )方法，并且将locations传递进去
        let theRegion = region(for: locations)
        
        mapView.setRegion(theRegion, animated: true)
    }
    
    
    // MARK: - 自定义方法
    
    /// 从CoreData Store中取出数据，然后将其展示在mapView上面
    func updateLocations() {
        
        mapView.removeAnnotations(locations)
        
        let entity = Location.entity()
        
        let fetchRequest = NSFetchRequest<Location>()
        fetchRequest.entity = entity
        
        locations = try! managedObjectContext.fetch(fetchRequest)
        
        mapView.addAnnotations(locations)
    }
    
    /// 返回已标记的区域信息
    func region(for annotations: [MKAnnotation]) -> MKCoordinateRegion {
        
        let region: MKCoordinateRegion
        
        switch annotations.count {
        case 0:
            region = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            
        case 1:
            let annotation = annotations[annotations.count - 1]
            
            region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            
        default:
            var topLeft = CLLocationCoordinate2D(latitude: -90, longitude: 180)
            var bottomRight = CLLocationCoordinate2D(latitude: 90, longitude: -180)
            
            for annotation in annotations {
                
                topLeft.latitude = max(topLeft.latitude, annotation.coordinate.latitude)
                topLeft.longitude = min(topLeft.longitude, annotation.coordinate.longitude)
                
                bottomRight.latitude = min(bottomRight.latitude, annotation.coordinate.latitude)
                bottomRight.longitude = max(bottomRight.longitude, annotation.coordinate.longitude)
            }
            
            let center = CLLocationCoordinate2D(
                latitude: topLeft.latitude - (topLeft.latitude - bottomRight.latitude) / 2,
                longitude: topLeft.longitude - (topLeft.longitude - bottomRight.longitude) / 2)
            
            let extraSpace = 1.1
            
            // abs()函数用来取绝对值
            let span = MKCoordinateSpan(
                latitudeDelta: abs(topLeft.latitude - bottomRight.latitude) * extraSpace,
                longitudeDelta: abs(topLeft.longitude - bottomRight.longitude) * extraSpace)
            
            region = MKCoordinateRegion(center: center, span: span)
        }
        
        return mapView.regionThatFits(region)
    }
    
    
}


// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    //
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // 校验annotation的真实类型是否为Location
        guard annotation is Location else {
            return nil
        }
        
        // 设置annotationView的可重用标识符(类似于tableViewCell的可重用机制)
        let identifier = "Location"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        // 判断annotationView是否为nil
        if annotationView == nil {
            
            // 如果annotationView为空，则创建MKPinAnnotationView
            // 实例对象，并且给它设置一个可重用标识符
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            // 设置pinView的相关属性
            pinView.isEnabled = true
            pinView.canShowCallout = true
            pinView.animatesDrop = false
            pinView.pinTintColor = UIColor(red: 0.32, green: 0.82, blue: 0.4, alpha: 1)  // 设置大头针的颜色为绿色
            
            // 创建一个rightButton
            let rightButton = UIButton(type: .detailDisclosure)
            
            // 监听按钮rightButton的点击
            rightButton.addTarget(self, action: #selector(showLocationDetails(_:)), for: .touchUpInside)
            
            // 将按钮rightButton赋值给pinView的rightCalloutAccessoryView
            pinView.rightCalloutAccessoryView = rightButton
            
            // 再将pinView赋值给annotationView
            annotationView = pinView
        }
        
        // 对annotationView进行校验
        if let annotationView = annotationView {
            
            // 将annotation赋值给annotationVie的annotation
            annotationView.annotation = annotation
            
            // 取出annotationView中的rightCalloutAccessoryView
            // 并且将其转换为UIButton类型
            let button = annotationView.rightCalloutAccessoryView as! UIButton
            
            // 获取annotation所在的下标值
            /*
            if let index = locations.index(of: annotation as! Location) {
                
                // 将下标值index与button的tag进行绑定
                button.tag = index
            }*/
            
            // 在Swift 4.2中，index(of: )被firstIndex(of: )取代了
            if let index = locations.firstIndex(of: annotation as! Location) {
                button.tag = index
            }
        }
        
        return annotationView
    }
    
    
    
    
}



// MARK: - 监听按钮的点击事件
extension MapViewController {
    
    /// 点击地图上面的annotationView(大头针)时调用
    @objc func showLocationDetails(_ sender: UIButton) {
        
        // 根据标识符，执行指定的segue
        performSegue(withIdentifier: "EditLocation", sender: sender)
    }
}
