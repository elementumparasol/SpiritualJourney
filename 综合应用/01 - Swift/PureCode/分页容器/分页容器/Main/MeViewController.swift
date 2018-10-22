//
//  MeViewController.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    // MARK: - 自定义属性
    
    /// 导航栏高度
    private var navigationBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 获取导航栏的高度
        if let height = navigationController?.navigationBar.frame.size.height {
            navigationBarHeight = height
        }
        
        // 设置UI界面
        setupUI()
    }
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 设置导航栏标题
        title = "我的"
    }
    
    deinit {
        print("MeViewController --- 控制器被销毁")
    }
    


}
