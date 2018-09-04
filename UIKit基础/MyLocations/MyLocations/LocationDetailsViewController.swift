//
//  LocationDetailsViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/1.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreLocation

class LocationDetailsViewController: UITableViewController {
    
    // MARK: - @IBOutlet
    
    /// textView控件
    @IBOutlet weak var descriptionTextView: UITextView!
    
    /// categoryLabel控件
    @IBOutlet weak var categoryLabel: UILabel!
    
    /// latitudeLabel控件
    @IBOutlet weak var latitudeLabel: UILabel!
    
    /// longitudeLabel控件
    @IBOutlet weak var longitudeLabel: UILabel!
    
    /// addressLabel控件
    @IBOutlet weak var addressLabel: UILabel!
    
    /// dateLabel控件
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    
    /// 经纬度(包含通过locationManager获取到的location信息，如经纬度)
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    /// 地标信息(包含街道和城市信息)
    var placemark: CLPlacemark?
    
    /// 创建DateFomatter
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    
    
    // MARK: - @IBAction
    
    
    /// 点击导航栏上面的完成按钮
    @IBAction func done() {
        
        // 从导航栏堆栈中退出栈顶控制器
        navigationController?.popViewController(animated: true)
    }
    
    /// 点击导航栏上面的取消按钮
    @IBAction func cancel() {
        
        // 从导航栏堆栈中退出栈顶控制器
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - 类自带的方法
    
    /// 控制器view即将显示的时候调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 显示导航条
        navigationController?.isNavigationBarHidden = false
    }
    
    /// 控制器的view加载完毕之后调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.text = ""
        categoryLabel.text = ""
        
        // 设置经纬度信息
        latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
        longitudeLabel.text = String(format: "%.8f", coordinate.longitude)
        
        // 设置地址信息
        if let placemark = placemark {
            addressLabel.text = string(from: placemark)
        } else {
            addressLabel.text = "No Address Found"
        }
        
        // 设置时间信息
        dateLabel.text = format(date: Date())
    }
    
    
    // MARK: - 自定义方法
    
    /// 获取详细的地址信息(国家 省 市 区 街道 门牌号 邮编)
    func string(from placemark: CLPlacemark) -> String {
        
        // 用于存储详细的地址信息
        var text = ""
        
        /**
         按照中国人的习惯，将国家信息放在最前面，即
         - 中国，上海，上海市，杨浦区，街道信息，门牌号，邮编信息
         */
        
        // 国家信息
        if let s = placemark.country {
            text += s
        }
        
        // 州或者省级信息
        if let s = placemark.administrativeArea {
            text += s + " "
        }
        
        // 城市信息
        if let s = placemark.locality {
            text += s + ", "
        }
        
        // 街道信息
        if let s = placemark.thoroughfare {
            text += s + ", "
        }
        
        // 街道详细信息
        if let s = placemark.subThoroughfare {
            text += s + " "
        }
        
        // 邮编信息
        if let s = placemark.postalCode {
            text += s + ", "
        }
        
        return text
    }
    
    /// 显示时间信息(将时间转换为字符串，以便于阅读)
    func format(date: Date) -> String {
        
        return dateFormatter.string(from: date)
    }
    
    
    
    
    
    
}



// MARK: - UITableViewDelegate
extension LocationDetailsViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return 88
        } else if indexPath.section == 2 && indexPath.row == 2 {
            addressLabel.frame.size = CGSize(width: view.bounds.size.width - 120, height: 1000)
            addressLabel.sizeToFit()
            addressLabel.frame.origin.x = view.bounds.size.width - addressLabel.frame.size.width - 16
            return addressLabel.frame.size.height + 20
        } else {
            return 44
        }
    }
    
    
    
    
    
}
