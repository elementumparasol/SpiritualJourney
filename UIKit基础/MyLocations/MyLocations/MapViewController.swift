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
    
    ///
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



extension MapViewController: MKMapViewDelegate {
    
    //
}
