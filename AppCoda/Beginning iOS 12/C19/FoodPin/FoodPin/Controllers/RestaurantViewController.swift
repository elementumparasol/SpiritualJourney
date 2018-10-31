//
//  RestaurantViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreData

class RestaurantViewController: UITableViewController {
    
    // MARK: - @IBOutlet
    
    /// emptyView，如果tableView中没有数据
    /// 时，就优先展示这个emptyView
    @IBOutlet weak var emptyView: UIView!
    
    
    // MARK: - 自定义属性
    
    /// 和餐厅有关的数据
    var restaurants: [RestaurantMO] = []
    
    /// fetchedResultsController，用于从Core Data中取出数据
    var fetchedResultsController: NSFetchedResultsController<RestaurantMO>!

    
    
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
        
        // 从Core Data中取出数据
        fetchedResults()
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
        
        // 先检查tableView中有没有数据，如果没有，就展示emptyView
        tableView.backgroundView = emptyView
        
        // 隐藏emptyView
        tableView.backgroundView?.isHidden = true
        
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
    
    
    /// 从CoreData中取出数据
    private func fetchedResults() {
        
        let fetchRequest: NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = UIApplication.shared.delegate
            as? AppDelegate {
            
            let context = appDelegate.persistentContainer.viewContext
            
            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            fetchedResultsController.delegate = self
            
            do {
                try fetchedResultsController.performFetch()
                
                if let fetchedObjects = fetchedResultsController.fetchedObjects {
                    restaurants = fetchedObjects
                }
            } catch {
                print(error)
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
        
        // 处理tableView的backgroundView和分割线
        if restaurants.count > 0 {
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        } else {
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
        
        return restaurants.count
    }

    // 返回tableView中的cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 根据可重用标识符取出cell
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantCell

        // 设置cell数据
        cell.nameLabel.text = restaurants[indexPath.row].name
        
        // 因为我们不再是通过图片名称来加载图片了，而是直接
        // 加载图片的二进制数据，因此这里需要修改
        if let restaurantImage = restaurants[indexPath.row].image {
            cell.thumbnailImageView
                .image = UIImage(data: restaurantImage as Data)
        }
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true

        return cell
    }
    

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
            
            let defaultText = "Just check in at " + self.restaurants[indexPath.row].name!
            
            // 创建activityController
            let activityController: UIActivityViewController
            
            if let restaurantImage = self.restaurants[indexPath.row]
                .image, let imageToShare = UIImage(data: restaurantImage as Data) {
                
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


// MARK: - NSFetchedResultsControllerDelegate
extension RestaurantViewController: NSFetchedResultsControllerDelegate {
    
    /**
     * 只要是Content发生任何改变，下面这三个代理方法都会被调用
     */
    
    //
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        //
        tableView.beginUpdates()
    }
    
    //
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
            
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            restaurants = fetchedObjects as! [RestaurantMO]
        }
    }
    
    //
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        //
        tableView.endUpdates()
    }
}
