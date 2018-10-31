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
    
    /// 餐厅数据(可以将其存放在plist文件中，然后在从plist文件中加载)
    var restaurants:[Restaurant] = [
        
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", details: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", imageName: "cafedeadend.jpg", isVisited: false),
        
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "348-233423", details: "A little gem hidden at the corner of the street is nothing but fantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", imageName: "homei.jpg", isVisited: false),
        
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", details: "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", imageName: "teakha.jpg", isVisited: false),
        
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "453-333423", details: "A great cafe in Austrian style. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. We also serve breakfast and light lunch. Come over to enjoy the elegant ambience and quality coffee..", imageName: "cafeloisl.jpg", isVisited: false),
        
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "983-284334", details: "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan.", imageName: "petiteoyster.jpg", isVisited: false),
        
        Restaurant(name: "For Kee Restaurant", type: "Hong Kong", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "232-434222", details: "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM.", imageName: "forkeerestaurant.jpg", isVisited: false),
        
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phone: "234-834322", details: "A boutique bakery focusing on artisan breads and pastries paired with inspiration from Japan and Scandinavia. We are crazy about bread and excited to share our artisan bakes with you. We open at 10 every morning, and close at 7 PM.", imageName: "posatelier.jpg", isVisited: false),
        
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phone: "982-434343", details: "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!", imageName: "bourkestreetbakery.jpg", isVisited: false),
        
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phone: "734-232323", details: "Haigh's Chocolates is Australia's oldest family owned chocolate maker. We have been making chocolate in Adelaide, South Australia since 1915 and we are committed to the art of premium chocolate making from the cocoa bean. Our chocolates are always presented to perfection in our own retail stores. Visit any one of them and you'll find chocolate tasting, gift wrapping and personalised attention are all part of the service.", imageName: "haighschocolate.jpg", isVisited: false),
        
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phone: "872-734343", details: "We offer an assortment of on-site baked goods and sandwiches. This place has always been a favourite among office workers. We open at 7 every morning including Sunday, and close at 4 PM. Come over, have a coffee and enjoy a chit-chat with our baristas.", imageName: "palominoespresso.jpg", isVisited: false),
        
        Restaurant(name: "Upstate", type: "Seafood", location: "95 1st Ave New York, NY 10003", phone: "343-233221", details: "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM. ", imageName: "upstate.jpg", isVisited: false),
        
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", details: "A young crowd populates this pork-focused American eatery in an older Williamsburg neighborhood. We open at 6PM, and close at 11 PM. If you enjoy a shared small plates dinner experience, come over and have a try.", imageName: "traif.jpg", isVisited: false),
        
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", details: "Classic Italian deli & butcher draws patrons with meat-filled submarine sandwiches. We use the freshest meats and veggies to create the perfect panini for you. We look forward to seeing you!", imageName: "grahamavenuemeats.jpg", isVisited: false),
        
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", details: "Small shop, some seating, definitely something different! We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of waffles with choices of sweet & savory fillings. If you are gluten free and craving waffles, this is the place to go.", imageName: "wafflewolf.jpg", isVisited: false),
        
        Restaurant(name: "Five Leaves", type: "Bistro", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", details: " Great food, cocktails, ambiance, service. Nothing beats having a warm dinner and a whiskey. We open at 8 every morning, and close at 1 AM. The ricotta pancakes are something you must try.", imageName: "fiveleaves.jpg", isVisited: false),
        
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", details: "Good place, great environment and amazing food! We open at 10 every morning except Sunday, and close at 9 PM. Give us a visit! Enjoy mushroom raviolis, pumpkin raviolis, meat raviolis with sausage and peppers, pork cutlets, eggplant parmesan, and salad.", imageName: "cafelore.jpg", isVisited: false),
        
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phone: "643-332323", details: "Most delicious cocktail you would ever try! Our menu includes a wide range of high quality internationally inspired dishes, vegetarian options, and local cuisine. We open at 10 AM, and close at 10 PM. We welcome you into our place to enjoy a meal with your friends.", imageName: "confessional.jpg", isVisited: false),
        
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phone: "542-343434", details: "a collection of authentic Spanish Tapas bars in Central London! We have an open kitchen, a beautiful marble-topped bar where guests can sit and watch the chefs at work and stylish red leather stools. Lunch starts at 1 PM. Dinners starts 5:30 PM.", imageName: "barrafina.jpg", isVisited: false),
        
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phone: "722-232323", details: "Very good basque food, creative dishes with terrific flavors! Donostia is a high end tapas restaurant with a friendly relaxed ambiance. Come over to enjoy awesome tapas!", imageName: "donostia.jpg", isVisited: false),
        
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phone: "343-988834", details: "Specialise in great pub food. Established in 1872, we have local and world lagers, craft beer and a selection of wine and spirits for people to enjoy. Don't forget to try our range of Young's Ales and Fish and Chips.", imageName: "royaloak.jpg", isVisited: false),
        
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", details: "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!", imageName: "caskpubkitchen.jpg", isVisited: false)
    ]
    
    
    // MARK: - 类自带的方法
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 因为我们在当前控制器中设置hidesBarsOnSwipe为true
        // 而在它的下一级控制器中设置hidesBarsOnSwipe为false
        // 当我们在当前控制器中滑动tableView时，导航栏会被自动
        // 隐藏，在这种情况下，如果点击某一行cell跳转到下一级控制
        // 器时，下一级控制器的导航条会被隐藏，此时不管我们怎会滑
        // 动下一级控制器，下一级控制器的导航条不会再出现，也就是
        // 说我们没办法再回到当前控制器了。为了解决这个bug，需要
        // 在当前控制器和下一级控制器中分别重写viewWillAppear方
        // 法，重新设置hidesBarsOnSwipe属性的值。这个主要是因为
        // viewDidLoad方法只会被执行一次造成的
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 适配iPad横屏(让横屏效果更好)
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // 设置UI界面
        setupUI()
    }
    
    // 通过重写prepare(for：sender :)方法，
    // 将目标控制器需要的数据传递过去
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 通过segue标识符找到正确的目标控制器
        if segue.identifier == "showRestaurantDetails" {
            
            // 获取indexPath
            if let indexPath = tableView.indexPathForSelectedRow {
                
                // 获取目标控制器
                let destinationController = segue.destination as! RestaurantDetailViewController
                
                // 将数据传递给目标控制器
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
            
    }
    
    
    // MARK: - @IBAction
    
    /// 点击添加新餐馆控制器导航条上面的关闭按钮，通过Unwind的方式返回到当前控制器
    ///
    /// - Parameter segue: Unwind segue
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 设置导航条的UI界面
        setupNavigationBar()
    }
    
    /// 设置navigationBar
    private func setupNavigationBar() {
        
        // 开启大标题
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 设置导航条的背景图片
        navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        
        // 设置导航条的shadowImage
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // 设置导航条的字体
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(r: 231, g: 76, b: 60)]
        
        // 在执行滑动手势时，隐藏导航栏
        navigationController?.hidesBarsOnSwipe = true
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


