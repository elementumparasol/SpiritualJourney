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
    var restaurants:[Restaurant] = [
        
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", imageName: "cafedeadend", isVisited: false),
        
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", imageName: "homei", isVisited: false),
        
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", imageName: "teakha", isVisited: false),
        
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", imageName: "cafeloisl", isVisited: false),
        
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", imageName: "petiteoyster", isVisited: false),
        
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", imageName: "forkeerestaurant", isVisited: false),
        
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", imageName:"posatelier", isVisited: false),
        
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", imageName: "bourkestreetbakery", isVisited: false),
        
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", imageName:"haighschocolate", isVisited: false),
        
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", imageName: "palominoespresso", isVisited: false),
        
        Restaurant(name: "Upstate", type: "American", location: "New York", imageName: "upstate", isVisited: false),
        
        Restaurant(name: "Traif", type: "American", location: "New York", imageName: "traif", isVisited: false),
        
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", imageName: "grahamavenuemeats", isVisited: false),
        
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", imageName: "wafflewolf", isVisited: false),
        
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", imageName: "fiveleaves", isVisited: false),
        
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", imageName: "cafelore", isVisited: false),
        
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", imageName: "confessional", isVisited: false),
        
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", imageName: "barrafina", isVisited: false),
        
        Restaurant(name: "Donostia", type: "Spanish", location: "London", imageName: "donostia", isVisited: false),
        
        Restaurant(name: "Royal Oak", type: "British", location: "London", imageName: "royaloak", isVisited: false),
        
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", imageName: "caskpubkitchen", isVisited: false)
    ]
    
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 适配iPad横屏(让横屏效果更好)
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // 开启大标题
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // 通过重写prepare(for：sender :)方法，
    // 将目标控制器需要的数据传递过去
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 通过segue标识符找到正确的目标控制器
        if segue.identifier == "showRestaurantDetails" {
            
            // 获取indexPath
            if let indexPath = tableView.indexPathForSelectedRow {
                
                // 获取目标控制器
                let destinationController = segue.destination as! DetailViewController
                
                // 将数据传递给目标控制器
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
            
    }

    // MARK: - Table view data source

    // 返回tableView中cell的分组数(如果不实现，默认分组数为1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    // 返回tableView中每一组cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurants.count
    }

    // 返回tableView中的cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 根据可重用标识符取出cell
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantCell

        // 设置cell数据
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].imageName)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true

        return cell
    }
    
    
    // MARK: - Table view data delegate
    
    /*
    
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
    
    */

    // 从右边往左边滑动cell时调用
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 创建UIContextualAction实例，用于执行删除操作
        // 其使用和UIAlertAction非常的像
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            // 删除数据
            self.restaurants.remove(at: indexPath.row)
//            self.restaurantTypes.remove(at: indexPath.row)
//            self.restaurantLocations.remove(at: indexPath.row)
//            self.restaurantImages.remove(at: indexPath.row)
//            self.isRestaurantVisited.remove(at: indexPath.row)
            
            // 刷新指定的cell
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // 成功完成这个action之后，调用闭包来关闭action按钮
            // 其中参数true表示当前action已经被执行完毕了
            completionHandler(true)
        }
        
        // 再创建一个UIContextualAction实例，用于执行分享操作
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just check in at " + self.restaurants[indexPath.row].name
            
            // 创建activityController
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].imageName) {
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
            self.restaurants[indexPath.row].isVisited = (self.restaurants[indexPath.row].isVisited) ? false : true
            
            // 设置cell的标记图片是否隐藏
            cell.heartImageView.isHidden = self.restaurants[indexPath.row].isVisited ? false : true
            
            // 当前的action执行完毕之后，执行关闭动作
            completionHandle(true)
        }
        
        // 自定义action的外观
        let checkIcon = self.restaurants[indexPath.row].isVisited ? "undo" : "tick"
        checkinAction.image = UIImage(named: checkIcon)
        checkinAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        
        // UISwipeActionsConfiguration
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkinAction])
        
        return swipeConfiguration
    }
    
}


