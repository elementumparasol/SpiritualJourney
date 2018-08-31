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
    
    /// 是否更新位置信息
    var updatingLocation = false
    
    /// 位置信息错误
    var lastLocationError: Error?
    
    /// 用于执行geocoding的实例
    var geocoder = CLGeocoder()
    
    /// 包含返回的地址结果(geocoding的结果)
    var placemark: CLPlacemark?
    
    /// 是否需要执行reverse geocoding
    var performingReverseGeocoding = false
    
    /// 在执行geocoding是最后发生的错误
    var lastGeocodingError: Error?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 程序一起动就显示文本信息
        updateLabels()
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
        // locationManager.delegate = self
        // locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        // locationManager.startUpdatingLocation()
        // startLocationManager()
        
        if updatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            
            placemark = nil
            lastGeocodingError = nil
            
            startLocationManager()
        }
        
        
        updateLabels()
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
            
            // 设置tagButton是否隐藏
            tagButton.isHidden = false
            
            // 设置messageLabel的文本内容为空
            messageLabel.text = ""
            
            
            if let placemark = placemark {
                addressLabel.text = string(from: placemark)
            } else if performingReverseGeocoding {
                addressLabel.text = "Searching for Address..."
            } else if lastGeocodingError != nil {
                addressLabel.text = "Error Finding Address"
            } else {
                addressLabel.text = "No Address Found"
            }
            
            
        } else {
            latitudelabel.text = ""
            longitudelabel.text = ""
            addressLabel.text = ""
            tagButton.isHidden = true
            // messageLabel.text = "Tap 'Get My Location' to Start."
            
            let statusMessage: String
            
            if let error = lastLocationError as NSError? {
                
                if error.domain == kCLErrorDomain &&
                    error.code == CLError.denied.rawValue {
                    statusMessage = "Location Services Disabled"
                } else {
                    statusMessage = "Error Getting Location"
                }
                
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap 'Get My Location' to Start"
            }
            
            messageLabel.text = statusMessage
            
            configureGetButton()
        }
    }
    
    /// 开始获取位置信息
    func startLocationManager() {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters  // 10米精度级别的
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
    /// 停止locationManager
    func stopLocationManager() {
        
        // 如果updatingLocation的值为false，那就说明
        // locationManager暂时处于非活跃状态，那就没必
        // 要停止locationManager了
        if updatingLocation {
            
            // 听通知更新location信息
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }
    
    /// 设置getButton的标题
    func configureGetButton() {
        
        if updatingLocation {
            getButton.setTitle("Stop", for: .normal)
        } else {
            getButton.setTitle("Get My Location", for: .normal)
        }
    }
    
    ///
    func string(from placemark: CLPlacemark) -> String {
        
        var line1 = ""
        
        if let s = placemark.subThoroughfare {
            line1 += s + " "
        }
        
        if let s = placemark.thoroughfare {
            line1 += s
        }
        
        var line2 = ""
        
        if let s = placemark.locality {
            line2 += s + " "
        }
        
        if let s = placemark.administrativeArea {
            line2 += s + " "
        }
        
        if let s = placemark.postalCode {
            line2 += s
        }
        
        return line1 + "\n" + line2
    }
    
    
    
    
}



// MARK: - CLLocationManagerDelegate
extension CurrentLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
        
        // 如果获取位置信息时，出现未知位置错误代码，直接返回
        // CLError.locationUnknown意味着locationManager
        // 暂时无法获取准确的位置信息
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        
        // 将其它更严重的错误存储到lastLocationError中
        lastLocationError = error
        
        // 如果出现了严重的错误，为了节省资源，就不需要
        // 一直获取位置信息，此时最好是停止locationManager
        stopLocationManager()
        
        // 更新文本控件上面的信息
        updateLabels()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 为什么要用最后一个？因为最后一个位置消息是最新的
        let newLocation = locations.last!  // 获取位置信息
        print("didUpdateLocations: \(newLocation)")
        
        // 将最新的位置信息保存到location中
        // location = newLocation
        
        // 在更新位置信息之前，先将之前的错误信息移除
        // lastLocationError = nil
        
        // 更新label上面的文本内容
        // updateLabels()
        
        
        // 如果获取地理位置信息等待时间过长，就用缓存信息
        if newLocation.timestamp.timeIntervalSinceNow < -5 {
            return
        }
        
        // 利用horizontalAccuracy来检测新获取的地理信息是否比之前
        // 获取的信息更精确。如果horizontalAccuracy的值小于0，那么
        // 这个值就是非法的，我们就可以忽略它
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        
        // 在获取地理位置信息时，值越大就表示约不精确(比如说，100米级别的
        // 肯定没有10米级别的精确)。所以，我们不仅要检测location里面是否
        // 有值，同时还要检测上一次的值是否比现在的值更精确。如果location
        // 之前没有值，我们就设置新返回来的值；如果上一次的值比这一次的值更
        // 大，就说明上一次的位置信息没有这次的位置信息精确，那么我们就需要
        // 设置新的值。为什么这里可以对location强制解包？因为如果location
        // 的值为nil，那么后半部分就不会继续执行，也就不存在危险的解包操作了
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy {
            
            // 能够走到这里，就说明已经获得了有用的地理位置信息
            // 那么，我们就可以清楚之前的错误信息了(也可能没有)
            lastLocationError = nil
            
            // 将新的地理位置信息，或者说更精确的地理
            // 位置信息存储到location中
            location = newLocation
            
            // 如果新获取到的位置信息中的horizontalAccuracy
            // 比之前一次要小，就说明我们已经获取到了更精准的位
            // 置信息，那么就没有必要再接着继续获取地理位置信息了
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy {
                print("*** We're done!")
                stopLocationManager()
            }
            
            // 更新各种label上面的内容
            updateLabels()
            
            
            
            if !performingReverseGeocoding {
                print("*** Going to geocode")
                performingReverseGeocoding = true
                geocoder.reverseGeocodeLocation(newLocation) { (placemarks, error) in
                    
//                    if let error = error {
//                        print("*** Reverse Geocoding error: \(error.localizedDescription)")
//                        return
//                    }
//
//                    if let places = placemarks {
//                        print("*** Found places: \(places)")
//                    }
                    
                    self.lastLocationError = error
                    if error == nil, let p = placemarks, !p.isEmpty {
                        self.placemark = p.last!
                    } else {
                        self.placemark = nil
                    }
                    
                    self.performingReverseGeocoding = false
                    self.updateLabels()
                }
            }
        }
    }















}
