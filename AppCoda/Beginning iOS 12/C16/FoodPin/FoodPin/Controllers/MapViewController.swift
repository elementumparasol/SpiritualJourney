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
        
        
    }
    
    
    
    
    
    
    

}
