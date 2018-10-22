//
//  HomeViewController.swift
//  HimalayanFM
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 统一设置UI界面
        setupUI()
    }
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        view.backgroundColor = UIColor.randomColor()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// http://114.80.170.74/discovery-category/customCategories/1540172273533?channel=ios-b1&code=43_310000_3100&customCategories=%5B%22recommend%22%2C%22vip%22%2C%22single_category-49%22%2C%22lamia%22%2C%22single_category-6%22%2C%22live%22%2C%22paid%22%2C%22single_category-12%22%2C%22single_category-39%22%2C%22single_category-9%22%2C%22single_category-48%22%2C%22single_category-2%22%5D&device=iPhone&version=6.5.24
