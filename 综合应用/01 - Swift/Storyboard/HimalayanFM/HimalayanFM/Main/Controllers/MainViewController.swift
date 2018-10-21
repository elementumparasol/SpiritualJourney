//
//  MainViewController.swift
//  HimalayanFM
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 统一设置UI界面
        setupUI()
    }
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 添加所有的tabBar子控制器
        addChildControllers()
    }
    
    /// 添加所有的tabBar子控制器
    private func addChildControllers() {
        
        // 根据指定的Storyboard名称加载tabBar子控制器
        addChildWith("Home")
        addChildWith("Hear")
        addChildWith("Find")
        addChildWith("Me")
    }
    
    /// 根据指定的storyboard名称，加载子控制器
    ///
    /// - Parameter storyboardName: 给定的storyboard名称
    private func addChildWith(_ storyboardName: String) {
        
        // 根据指定的storyboard初始化子控制器
        guard let childController = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() else { return }
        
        // 将子控制器childController添加到当前控制器中
        addChild(childController)
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
