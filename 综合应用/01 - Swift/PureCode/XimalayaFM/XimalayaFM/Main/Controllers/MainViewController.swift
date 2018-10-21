//
//  MainViewController.swift
//  XimalayaFM
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 统一设置UI界面
        setupUI()
    }
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 添加所有的tabBar标签控制器
        addChildControllers()
    }
    
    /// 添加所有的tabBar标签控制器
    private func addChildControllers() {
        
        // 添加tabBar标签控制器，并且设置tabBarItem的title和image
        addChild(HomeViewController(), imageName: "home", title: "首页")
        addChild(HearViewController(), imageName: "hear", title: "我听")
        addChild(FindViewController(), imageName: "find", title: "发现")
        addChild(MeViewController(), imageName: "me", title: "未登录")
    }
    
    /// 添加tabBar标签控制器
    ///
    /// - Parameters:
    ///   - childController: 子控制器
    ///   - imageName: tabBarItem上面image图片的名称
    ///   - title: tabBarItem上面title的名称
    private func addChild(_ childController: UIViewController, imageName: String, title: String = "") {
        
        // 设置tabBarItem的title
        if title != "" {
            childController.title = title
        }
        
        // 设置tabBarItem的image
        childController.tabBarItem.image = UIImage(named: "tab_\(imageName)_1_33x25_")?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: "tab_\(imageName)_2_33x25_")?.withRenderingMode(.alwaysOriginal)
        
        // 判断childController是否为HomeViewController
        if childController.isKind(of: HomeViewController.self) {
            
            // 直接将其作为子控制器添加到当前控制器上面
            addChild(childController)
        } else {
            
            // 先将其包装成导航控制器
            let navController = NavigationController(rootViewController: childController)
            
            // 再将其作为子控制器添加到当前控制器
            addChild(navController)
        }
    }

}
