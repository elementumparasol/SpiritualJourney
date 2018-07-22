//
//  NewsViewController.swift
//  控制器转场动画
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
    }

}


// MARK: - 统一设置UI界面
extension NewsViewController {
    
    
    /// 设置UI界面
    private func setupUI() {
        
        view.backgroundColor = UIColor.randomColor()
        
        // 设置导航栏
        setNavigationBarButtonItems()
    }
    
    
    /// 设置导航栏上面的barButtonItem
    private func setNavigationBarButtonItems() {
        
        // 设置导航栏左边的菜单按钮
        let menuItem = UIBarButtonItem(image: UIImage.imageWithOriginal("nav_left_menu_15x13_"), style: .plain, target: self, action: #selector(NewsViewController.menuBarButtonItemClick))
        
        // 设置导航栏左边的Logo按钮
        let logoItem = UIBarButtonItem(image: UIImage.imageWithOriginal("nav_new_log_34x43_"), style: .plain, target: self, action: #selector(NewsViewController.logoBarButtonItemClick))
        
        logoItem.imageInsets = UIEdgeInsets(top: 5, left: -55, bottom: 5, right: 0)
        
        // 统一设置导航栏左边的按钮
        navigationItem.leftBarButtonItems = [menuItem, logoItem]
        
        // 设置导航栏右边的barButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.imageWithOriginal("nav_search_new_18x18_"), style: .plain, target: self, action: #selector(NewsViewController.rightBarButtonItemClick))
    }
}


// MARK: - 监听导航条上面按钮的点击
extension NewsViewController {
    
    
    /// 监听导航条上面菜单按钮的点击
    @objc private func menuBarButtonItemClick() {
        
        print("NewsViewController.menuBarButtonItemClick")
    }
    
    /// 监听导航条上面Logo按钮的点击
    @objc private func logoBarButtonItemClick() {
        
        print("NewsViewController.logoBarButtonItemClick")
    }
    
    /// 监听导航条上面搜索按钮的点击
    @objc private func rightBarButtonItemClick() {
        
        // push控制器
        pushToSearchController()
    }
    
    
    private func pushToSearchController() {
        
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
