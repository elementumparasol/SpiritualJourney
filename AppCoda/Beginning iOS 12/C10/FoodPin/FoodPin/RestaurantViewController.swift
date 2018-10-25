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
        
        // 根据cell是否被标记来决定是否要显示checkmark
        cell.accessoryType = isRestaurantVisited[indexPath.row] ? .checkmark : .none

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
        
        // 创建UIAlertAction
        let checkinAction = UIAlertAction(title: "Check in", style: .default) { (action) in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            
            // 如果被访问了，则将其标记为false
            self.isRestaurantVisited[indexPath.row] = true
        }
        
        // 将UIAlertAction添加到alertController中
        alertController.addAction(checkinAction)
        
        // 显示alertController
        present(alertController, animated: true, completion: nil)
        
        // 去掉cell被选中时的高亮模式
        tableView.deselectRow(at: indexPath, animated: false)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


