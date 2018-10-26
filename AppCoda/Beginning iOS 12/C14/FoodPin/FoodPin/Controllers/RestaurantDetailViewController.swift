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
    
    
    // MARK: - @IBOutlet
    
    /// headerView
    @IBOutlet weak var headerView: RestaurantDetailHeaderView!
    
    /// tableView
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - 类自带的方法

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
