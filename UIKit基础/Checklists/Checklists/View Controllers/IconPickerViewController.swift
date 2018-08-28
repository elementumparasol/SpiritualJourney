//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/28.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}


class IconPickerViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 代理属性
    weak var delegate: IconPickerViewControllerDelegate?
    
    /// 数组数据
    let icons = ["No Icon", "Appointments", "Birthdays", "Chores", "Drinks",
                 "Folder", "Groceries", "Inbox", "Photos", "Trips"]
}



// MARK: - UITableViewDataSource
extension IconPickerViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
    }
}



// MARK: - UITableViewDelegate
extension IconPickerViewController {
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 通知代理
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            delegate.iconPicker(self, didPick: iconName)
        }
    }
}
