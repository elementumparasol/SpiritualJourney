//
//  ContainerView.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * 容器控件，里面装着用于展示内容的UIScrollView和显示标题的UIView
 */

import UIKit

class ContainerView: UIView {

    // MARK: - 私有属性
    
    /// 导航栏上面按钮的标题
    private var titles: [String]
    
    /// 导航栏按钮上面图片的URL字符串
    private var imageURLStrings: [String]
    
    /// 所有的子控制器
    private var childControllers: [UIViewController]
    
    /// 容器控件的父控制器
    private weak var parentController: UIViewController?
    
    /// 对标题等内容进行其它设置
    private var settings: Settings
    
    
    
    // MARK: - 自定义方法
    
    /// 构造方法，用于创建ContainerView实例对象
    ///
    /// - Parameters:
    ///   - frame: 用于设置当前实例对象的frame
    ///   - titles: 用于保存从外部控制器传递进来的按钮标题数据
    ///   - settings: 用于保存从外部控制器传递进来的设置
    ///   - childControllers: 用于保存从外部传递进来的子控制器
    ///   - parentController: 当前实例对象的父控制器
    ///   - imageURLStrings: 用于保存从外部控制器传递进来的按钮图片的URL字符串
    init(frame: CGRect, titles: [String], settings: Settings, childControllers: [UIViewController], parentController: UIViewController?, imageURLStrings: [String] = []) {
        
        // 初始化自己的属性
        self.titles = titles
        self.imageURLStrings = imageURLStrings
        self.settings = settings
        self.childControllers = childControllers
        self.parentController = parentController
        
        // 初始化父类的属性
        super.init(frame: frame)
        
        // 开展其它工作
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
        print("ContainerView --- 被销毁")
    }
    
}
