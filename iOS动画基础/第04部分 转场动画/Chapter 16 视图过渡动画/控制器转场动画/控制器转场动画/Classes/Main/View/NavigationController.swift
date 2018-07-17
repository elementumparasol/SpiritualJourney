//
//  NavigationController.swift
//  控制器转场动画
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    // 修改状态栏的颜色(如果控制器嵌套了导航控制器，并且有必要修改状态栏颜色的话)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 判断是否为根控制器
        if viewControllers.count > 0 {
            
            // 隐藏底部的tabBar
            viewController.hidesBottomBarWhenPushed = true
        }
        
        // 还原系统的push方法(这个很重要，如果忘记还原系统的push方法，那么所有的push操作都将会被破坏)
        super.pushViewController(viewController, animated: animated)
    }
}


// MARK: - 统一设置UI界面
extension NavigationController {
    
    
    /// 统一设置导航控制器的UI界面
    private func setupUI() {
        
        // 
    }
}

