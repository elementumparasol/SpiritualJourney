//
//  ContentView.swift
//  分页容器
//
//  Created by Enrica on 2018/10/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * UIScrollView或者UICollectionView和子控制器的父控件
 */

import UIKit

class ContentView: UIView {

    // MARK: - 用于保存有父控件ContrainerView传递进来的数据

    /// 保存由父控件传递进来的子控制器
    private var childControllers: [UIViewController]
    
    /// 保存由父控件传递进来的父控制器
    private var parentController: UIViewController
    
    /// 保存由父控件传递进来的settings
    private var settings: Settings
    
    
    
    init(frame: CGRect, childControllers: [UIViewController], parentController: UIViewController, settings: Settings) {
        
        self.childControllers = childControllers
        self.parentController = parentController
        self.settings = settings
        
        super.init(frame: frame)
        
        // 设置UI界面
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
