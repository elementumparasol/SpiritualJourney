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
    
    /// 用于存储当前的位置信息
    var location: CLLocation?

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
        
        // 如果获取地理位置新的的授权被禁止或者限制了，就会弹出alert进行提示
        if authStatus == .denied || authStatus == .restricted {
            showLocationServicesDeniedAlert()
            return
        }
        
        // 设置当前控制器为locationManager的代理
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    
    // MARK: - 自定义方法
    
    /// 如果获取地理位置被禁止，则弹出提示
    func showLocationServicesDeniedAlert() {
        
        // 创建alertController
        let alert = UIAlertController(title: "Location Services Disabled",
                                      message: "Please enable location services for this app in Settings.",
                                      preferredStyle: .alert)
        
        // 创建action
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // 将action添加到alert控制器中
        alert.addAction(okAction)
        
        // 弹出alert控制器
        present(alert, animated: true, completion: nil)
    }
    
    /// 更新文本控件上面的内容
    func updateLabels() {
        
        if let location = location {
            
            // 更新纬度信息
            latitudelabel.text = String(format: "%.8f", location.coordinate.latitude)
            
            // 更新经度信息
            longitudelabel.text = String(format: "%.8f", location.coordinate.longitude)
            
            //
            tagButton.isHidden = false
            messageLabel.text = ""
        } else {
            latitudelabel.text = ""
            longitudelabel.text = ""
            addressLabel.text = ""
            tagButton.isHidden = true
            messageLabel.text = "Tap 'Get My Location' to Start."
        }
    }
}



// MARK: - CLLocationManagerDelegate
extension CurrentLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 为什么要用最后一个？因为最后一个位置消息是最新的
        let newLocation = locations.last!  // 获取位置信息
        print("didUpdateLocations: \(newLocation)")
        
        // 将最新的位置信息保存到location中
        location = newLocation
        
        // 更新label上面的文本内容
        updateLabels()
    }
}
