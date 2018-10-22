//
//  MainViewController.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
    }
    
    private func setupUI() {
        
        // 添加所有的tabBar标签控制器
        addChildControllers()
    }
    
    /// 添加所有的tabBar子控制器
    private func addChildControllers() {
        
        // 添加tabBar标签控制器
        addChild(HomeViewController(), imageName: "home", title: "首页")
        addChild(HearViewController(), imageName: "hear", title: "我听")
        addChild(FindViewController(), imageName: "find", title: "发现")
        addChild(MeViewController(), imageName: "me", title: "我的")
    }
    
    /// 根据
    ///
    /// - Parameters:
    ///   - childController: tabBar的子控制器
    ///   - imageName: tabBarItem上面图片的名称
    ///   - title: tabBarItem上面标题的名称
    private func addChild(_ childController: UIViewController, imageName: String, title: String) {
        
        // 设置tabBarItem的title标题
        childController.tabBarItem.title = title
        
        // 设置tabBarItem的image图片
        childController.tabBarItem.image = UIImage(named: "tab_\(imageName)_1_33x25_")?.withRenderingMode(.alwaysOriginal)
        
        // 设置tabBarItem的selectedImage图片
        childController.tabBarItem.selectedImage = UIImage(named: "tab_\(imageName)_2_33x25_")?.withRenderingMode(.alwaysOriginal)
        
        if childController.isKind(of: HomeViewController.self) {
            
            // 直接将其添加到tabBar控制器中
            addChild(childController)
        } else {
            
            // 先将childController包装成导航控制器
            let nav = NavigationController(rootViewController: childController)
            
            // 再将其添加到tabBar控制器控制器
            addChild(nav)
        }
        
        
    }

}
