//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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

        // 设置和餐厅相关的数据
        headerView.headerImageView.image = UIImage(named: restaurant.imageName)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.heartImageView.isHidden = restaurant.isVisited ? false : true
        
        // 关闭大标题模式
        navigationItem.largeTitleDisplayMode = .never
    }

}
