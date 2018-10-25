//
//  RestaurantViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 餐馆名称
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia" , "Royal Oak", "CASK Pub and Kitchen"]

    /// 图片名称
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    /// 地点
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    /// 类型
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood" , "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    /// 记录cell是否被标记
    var isRestaurantVisited = Array(repeating: false, count: 21)
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 适配iPad横屏(让横屏效果更好)
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source

    // 返回tableView中cell的分组数(如果不实现，默认分组数为1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    // 返回tableView中每一组cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantNames.count
    }

    // 返回tableView中的cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 根据可重用标识符取出cell
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantCell

        // 设置cell数据
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.heartImageView.isHidden = isRestaurantVisited[indexPath.row] ? false : true

        return cell
    }
    
    
    // MARK: - Table view data delegate
    
    // 选中tableView中某一行cell时调用
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 创建UIAlertController
        let alertController = UIAlertController(title: nil, message: "Whate do you want to do?", preferredStyle: .actionSheet)
        
        // 适配在iPad中点击cell弹出actionSheet崩溃的bug
        // 当程序在iPhone上运行时，这个属性会被设置为nil
        if let popoverController = alertController.popoverPresentationController {
            
            if let cell = tableView.cellForRow(at: indexPath) {
                
                // 设置popoverController从cell上弹出action
                popoverController.sourceView = cell
                
                // 设置popoverController弹出action的位置
                popoverController.sourceRect = cell.bounds
            }
        }
        
        /**
         * 第一个UIAlertAction
         */
        
        // 创建取消action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // 将第一个UIAlertAction添加到alertController中
        alertController.addAction(cancelAction)
        
        
        /**
         * 第二个UIAlertAction
         */
        
        // 创建callActionHandler
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            
            // 创建alertController
            let messageAlert = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            
            // 创建alertAction
            let messageAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            // 将alertAction添加到alertController中
            messageAlert.addAction(messageAction)
            
            // 显示alertController
            self.present(messageAlert, animated: true, completion: nil)
        }
        
        // 创建UIAlertAction
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        
        // 将第二个UIAlertAction添加到alertController中
        alertController.addAction(callAction)
        
        
        /**
         * 第三个UIAlertAction
         */
        
        // 创建标题
        let checkActionTitle = isRestaurantVisited[indexPath.row] ? "Undo Check in" : "Check in"
        
        // 创建UIAlertAction
        let checkinAction = UIAlertAction(title: checkActionTitle, style: .default) { (action) in
            
            // 取出cell
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantCell
            
            // 取出cell中是否标记数据
            self.isRestaurantVisited[indexPath.row] = (self.isRestaurantVisited[indexPath.row]) ? false : true
            
            // 设置cell的标记图片是否隐藏
            cell.heartImageView.isHidden = (self.isRestaurantVisited[indexPath.row]) ? false : true
        }
        
        // 将UIAlertAction添加到alertController中
        alertController.addAction(checkinAction)
        
        // 显示alertController
        present(alertController, animated: true, completion: nil)
        
        // 去掉cell被选中时的高亮模式
        tableView.deselectRow(at: indexPath, animated: false)
    }

    // 从右边往左边滑动cell时调用
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 创建UIContextualAction实例，用于执行删除操作
        // 其使用和UIAlertAction非常的像
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            // 删除数据
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.isRestaurantVisited.remove(at: indexPath.row)
            
            // 刷新指定的cell
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // 成功完成这个action之后，调用闭包来关闭action按钮
            // 其中参数true表示当前action已经被执行完毕了
            completionHandler(true)
        }
        
        // 再创建一个UIContextualAction实例，用于执行分享操作
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just check in at " + self.restaurantNames[indexPath.row]
            
            // 创建activityController
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            // 对UIActivityViewController在iPad上面的表现进行适配
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            // 显示activityController
            self.present(activityController, animated: true, completion: nil)
            
            // 成功完成这个action之后，调用闭包来关闭action按钮
            // 其中参数true表示当前action已经被执行完毕了
            completionHandler(true)
        }
        
        // 自定义UIContextualAction的外观
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        // 创建UISwipeActionsConfiguration实例
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }

    // 从左往右滑动cell时调用
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 创建UIContextualAction实例
        let checkinAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandle) in
            
            // 取出cell
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantCell
            
            // 获取cell是否标记的数据
            self.isRestaurantVisited[indexPath.row] = (self.isRestaurantVisited[indexPath.row]) ? false : true
            
            // 设置cell的标记图片是否隐藏
            cell.heartImageView.isHidden = self.isRestaurantVisited[indexPath.row] ? false : true
            
            // 当前的action执行完毕之后，执行关闭动作
            completionHandle(true)
        }
        
        // 自定义action的外观
        let checkIcon = self.isRestaurantVisited[indexPath.row] ? "undo" : "tick"
        checkinAction.image = UIImage(named: checkIcon)
        checkinAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        
        // UISwipeActionsConfiguration
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkinAction])
        
        return swipeConfiguration
    }
    
}


