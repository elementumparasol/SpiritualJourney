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
    var restaurantImageName = ""
    
    /// 餐厅名称数据
    var restaurantName = ""
    
    /// 餐厅位置数据
    var restaurantLocation = ""
    
    /// 餐厅类型数据
    var restaurantType = ""
    
    // MARK: - @IBOutlet
    
    /// 用于在detail控制器中显示餐馆图片的restaurantImageView
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    /// 餐厅名称
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    /// 餐厅位置
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    
    /// 餐厅类型
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置和餐厅相关的数据
        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantNameLabel.text = restaurantName
        restaurantLocationLabel.text = restaurantLocation
        restaurantTypeLabel.text = restaurantType
        
        // 关闭大标题模式
        navigationItem.largeTitleDisplayMode = .never
    }

}
