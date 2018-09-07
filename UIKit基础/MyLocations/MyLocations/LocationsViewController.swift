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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        
        // 取出location
        let location = locations[indexPath.row]
        
        // 调用configure(for: )方法，给cell设置数据
        // 从面相对象的角度来讲，一般自己的事情应该交给自
        // 己去做。所以，给cell设置数据的细节应该封装在
        // LocationCell这个类中
        cell.configure(for: location)

        return cell
    }
}
