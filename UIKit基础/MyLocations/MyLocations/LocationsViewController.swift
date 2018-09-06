//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/6.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation


class LocationsViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 获取managedObjectContext
    var managedObjectContext: NSManagedObjectContext!
    
    ///
    var locations = [Location]()
    
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NSFetchRequest主要用于描述从数据库中获取的对象
        // 如果要检索之前保存到数据库中的数据，就必须创建
        // NSFetchRequest实例对象。在使用NSFetchRequest
        // 的时候，必须要告诉它即将fetch的对象是什么类型
        let fetchRequest = NSFetchRequest<Location>()  // 泛型数组
        
        // 创建Location实体
        let entity = Location.entity()
        
        // 告诉fetchRequest实例，现在需要查找Location实体
        fetchRequest.entity = entity
        
        // 通过NSSortDescriptor实例告诉fetchRequest对date属性
        // 按照时间升序进行排序
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            
            // 告诉context，开始执行fetchRequest。fetch()方法
            // 要么返回一个已经排序好了数组，要么会抛出异常。如果操作
            // 成功，则将结果赋值给locations
            locations = try managedObjectContext.fetch(fetchRequest)
        } catch {
            fatalCoreDataError(error)
        }
        
        
    }
    
    
    
}



// MARK: - UITableViewDataSource
extension LocationsViewController {

    // 返回tableView中每一组cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    // 返回cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 根据可重用标识符取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        
        // 取出location
        let location = locations[indexPath.row]
        
        // 获取Description所在的Label
        let descriptionLabel = cell.viewWithTag(100) as! UILabel
        descriptionLabel.text = location.locationDescription

        // 获取Address所在的Label
        let addressLabel = cell.viewWithTag(101) as! UILabel
        
        if let placemark = location.placemark {
            
            var text = ""
            
            // 城市信息
            if let s = placemark.locality {
                text += s + " "
            }
            
            // 街道信息
            if let s = placemark.thoroughfare {
                text += s + " "
            }
            
            // 更加详细的街道信息
            if let s = placemark.subThoroughfare {
                text += s + " "
            }
            
            // 设置详细地址
            addressLabel.text = text
        } else {
            addressLabel.text = ""
        }

        return cell
    }
}
