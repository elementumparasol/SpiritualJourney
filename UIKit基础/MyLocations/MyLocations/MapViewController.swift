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
        
        //
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
    
    
    
    
}



extension MapViewController: MKMapViewDelegate {
    
    //
}
