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
    var restaurant = Restaurant()
    
    
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
    
    
    // MARK: - 类自带的方法
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        
        // 如果上一级控制器中恰好隐藏了导航栏，我们在这里让其重新出现
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 关闭大标题模式
        navigationItem.largeTitleDisplayMode = .never
        
        // 设置和餐厅相关的数据
        headerView.headerImageView.image = UIImage(named: restaurant.imageName)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.heartImageView.isHidden = restaurant.isVisited ? false : true
        
        // 让当前控制器成为tableView的数据源和代理
        tableView.dataSource = self
        tableView.delegate = self
        
        // 取消tableView的分割线
        tableView.separatorStyle = .none
        
        // 设置导航条UI界面
        navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
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
        return 3
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
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller.")
        }
    }
}


// MARK: - UITableViewDelegate
extension RestaurantDetailViewController: UITableViewDelegate {
    
    //
}
