//
//  MainViewController.swift
//  控制器转场动画
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 布局UI界面
        setupUI()
    }

}

// MAKR: - 统一设置UI布局
extension MainViewController {
    
    /// 布局UI界面
    private func setupUI() {
        
        // 一次加载对应的storyboard控制器
        addChild("News")
        addChild("Live")
        addChild("Television")
        addChild("Report")
        addChild("Me")
    }
    
    
    /// 根据名字加载storyboard控制器
    ///
    /// - Parameter storyboardName: storyboard控制器的名称
    private func addChild(_ storyboardName: String) {
        
        // 根据名字加载对应的storyboard控制器，并且对其进行初始化
        guard let childController = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() else { return }
        
        // 添加子控制器
        addChild(childController)
    }
}
