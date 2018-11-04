//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// 餐厅图片数据
    var restaurant: RestaurantMO!
    
    
    // MARK: - 类自带的属性
    
    // 重写当前控制器的preferredStatusBarStyle属性，改变状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - @IBOutlet
    
    /// headerView
    @IBOutlet weak var headerView: RestaurantDetailHeaderView!
    
    /// tableView
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - @IBAction
    
    /// 通过Unwind Segue的方式从下一级控制器返回到当前控制器
    ///
    /// - Parameter segue: Unwind Segue
    @IBAction func close(with segue: UIStoryboardSegue) {
        
        // dismiss控制器。其实这句代码是多余的
        // Unwind Segue本身就会自动dismiss
        dismiss(animated: true, completion: nil)
    }
    
    /// 通过Unwind Segue的方式逆向传递评价数据
    ///
    /// - Parameter segue: Unwind Segue
    @IBAction func rateRestaurant(with segue: UIStoryboardSegue) {
        
        dismiss(animated: true) {
            
            // 通过segue获取Unwind Segue的标识符
            if let rating = segue.identifier {
                
                // 将标识符存储到模型中
                self.restaurant.rating = rating
                
                // 因为我们的标识符中有大写字母，而图片全部是小写
                // 所以先把我们的标识符转换为全部小写字母，然后再
                // 将其设置到rateImageView控件上面去
                self.headerView.rateImageView.image = UIImage(named: rating.lowercased())
                
                
                if let appDelegate = UIApplication.shared
                    .delegate as? AppDelegate {
                    appDelegate.saveContext()
                }
                
                
                // 创建Transform
                let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                
                // 给headerView添加Transform动画
                self.headerView.rateImageView.transform = scaleTransform
                self.headerView.rateImageView.alpha = 0
                
                // 添加还原动画
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
                    
                    // 将headerView还原
                    self.headerView.rateImageView.transform = .identity
                    self.headerView.rateImageView.alpha = 1.0
                }, completion: nil)
            }
        }
    }
    
    
    // MARK: - 类自带的方法
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        
        // 如果上一级控制器中恰好隐藏了导航栏，我们在这里让其重新出现
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // 当控制器的view再次出现之前，恢复导航栏的tintColor
        navigationController?.navigationBar.tintColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 关闭大标题模式
        navigationItem.largeTitleDisplayMode = .never
        
        // 设置和餐厅相关的数据
        if let restaurantImage = restaurant.image {
            headerView.headerImageView
                .image = UIImage(data: restaurantImage as Data)
        }
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.heartImageView.isHidden = restaurant.isVisited ? false : true
        
        // 让当前控制器成为tableView的数据源和代理
        tableView.dataSource = self
        tableView.delegate = self
        
        // 取消tableView的分割线
        tableView.separatorStyle = .none
        
        // 修改导航条的背景图片(这里设置为空的图片，不是nil)
        navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        
        // 修改导航条阴影图片(这里设置为空的图片，不是nil)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // 修改导航条的tintColor
        navigationController?.navigationBar.tintColor = .white
        
        // 修改导航栏返回按钮的文字
//        navigationController?.navigationBar.topItem?.title = "Back"
        
        // contentInsetAdjustmentBehavior这个属性是UIScrollView
        // 的，因此只要是继承自UIScrollView的类都自动拥有这个属性，当然z
        // 也包括我们的tableView。该属性的作用是，为了防止导航栏遮挡住
        // UITableView的部分内容，iOS会自动调整tableView的内容区域，以
        // 确保它顶部的内容不会被导航栏盖住。但是，在我们这里已经把导航栏设
        // 置为透明的了，所以也就不存在导航栏遮挡住tableView顶部内容的问题，
        // 为此，需要告诉iOS不要自动调整tableView的内容区域，我们只需要将
        // 其设置为.never就可以了。另外，有一点需要注意！而且这一点非常的
        // 坑爹！也就是Safe Area。我们在对tableView进行约束的时候，顶部
        // 约束相对于UIView就可以了，如果是相对于Safe Area做约束，最后即
        // 便是设置了contentInsetAdjustmentBehavior的值为.never，最
        // 后iOS依然会自动调整tableView的内容边距
        tableView.contentInsetAdjustmentBehavior = .never
        
        // 因为它的上级控制器设置了在执行滑动手势时，隐藏导航栏
        // 所以当前控制器在执行滑动手势时，也会隐藏导航栏
        navigationController?.hidesBarsOnSwipe = false
        
        
        // 如果用户对餐厅有做出评价，那么就加载用户评价
        if let rating = restaurant.rating?.lowercased() {
            headerView.rateImageView.image = UIImage(named: rating)
        }
    }
    
    deinit {
        print("RestaurantDetailViewController --- 被销毁了")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMap" {
            
            // 获取跳转的目标控制器
            let destinationController = segue.destination as! MapViewController
            
            // 将被选中cell的数据传递给目标控制器
            destinationController.restaurant = restaurant
        } else if segue.identifier == "showRating" {
            
            let destinationgController = segue.destination as! RatingViewController
            destinationgController.restaurant = restaurant
        }
    }

}


// MARK: - UITableViewDataSource
extension RestaurantDetailViewController: UITableViewDataSource {
    
    // 返回tableView分组数，默认为1组(当它为1时，可以不实现)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 返回tableView每一组cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // 返回tableView的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            // 根据标识符取出与之对应的cell。我们在注册cell时，标识符名称
            // 和自定义cell的类名相同，这样一来，我们就可以通过使用
            // String(description: RestaurantDetailIconTextCell.self)
            // 来返回类名了(也就是标识符的名称)，这样做的好处是可以防止写错
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            
            // 设置cell的数据
            cell.iconImageView.image = UIImage(named: "phone")
            cell.shortTextLabel.text = restaurant.phone
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = restaurant.location
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            
            cell.descriptionLabel.text = restaurant.details
            cell.selectionStyle = .none
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            
            cell.titleLabel.text = "HOW TO GET THERE"
            cell.selectionStyle = .none
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            
            cell.selectionStyle = .none
            
            // 在地图上面显示annotation位置标记
            if let restaurantLocation = restaurant.location {
                cell.configure(location: restaurantLocation)
            }
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller.")
        }
    }
}


// MARK: - UITableViewDelegate
extension RestaurantDetailViewController: UITableViewDelegate {
    
    //
}
