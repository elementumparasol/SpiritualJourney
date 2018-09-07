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
    
    
    // MARK: - @IBAction
    
    /// 显示用户地理位置
    @IBAction func showUser() {
        
        // 指定区域范围(以用户为中心，1000X1000的范围)
        let regon = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        // 设置显示区域
        mapView.setRegion(mapView.regionThatFits(regon), animated: true)
    }
    
    /// 显示位置信息
    @IBAction func showLocations() {
        
        //
    }
}



extension MapViewController: MKMapViewDelegate {
    
    //
}
