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
    
    ///
    var managedObjectContext: NSManagedObjectContext!
    
    
    
    
    
    
}



// MARK: - UITableViewDataSource
extension LocationsViewController {

    // 返回tableView中每一组cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // 返回cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 根据可重用标识符取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        
        // 获取Description所在的Label
        let descriptionLabel = cell.viewWithTag(100) as! UILabel
        descriptionLabel.text = "随便搞点什么"

        // 获取Address所在的Label
        let addressLabel = cell.viewWithTag(101) as! UILabel
        addressLabel.text = "再搞一堆东西"

        return cell
    }
}
