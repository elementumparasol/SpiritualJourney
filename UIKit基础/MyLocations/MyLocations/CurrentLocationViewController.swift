//
//  CurrentLocationViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/8/29.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 消息label
    @IBOutlet weak var messageLabel: UILabel!
    
    /// 纬度
    @IBOutlet weak var latitudelabel: UILabel!
    
    /// 精度
    @IBOutlet weak var longitudelabel: UILabel!
    
    /// 地址
    @IBOutlet weak var addressLabel: UILabel!
    
    /// tag location
    @IBOutlet weak var tagButton: UIButton!
    
    /// get location
    @IBOutlet weak var getButton: UIButton!
    
    
    // MARK: - 自定义属性
    
    /// locationManager
    var locationManager =  CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // MARK: - @IBAction

    @IBAction func getLocation() {
        
        // 检查当前状态，如果未被允许，则请求获取GPS权限
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        // 如果获取地理位置被禁止了，则弹出alert提示
        if authStatus == .denied || authStatus == .restricted {
            showLocationServicesDeniedAlert()
            return
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    
    // MARK: - 自定义方法
    
    /// 如果获取地理位置被禁止，则弹出提示
    func showLocationServicesDeniedAlert() {
        
        let alert = UIAlertController(title: "Location Services Disabled",
                                      message: "Please enable location services for this app in Settings.",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}



// MARK: - CLLocationManagerDelegate
extension CurrentLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations: \(newLocation)")
    }
}
