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

    // MARK: - 保存由父控制器传递进来的数据
    
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
    
    
    // MARK: - 子控件属性
    
    /// 导航条的父控件
    private var titleView: TitleView!
    
    /// 子控制器的父控件
    private var contentView: ContentView!
    
    
    
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
        
        // 设置UI界面
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ContainerView --- 被销毁")
    }
    
    
    // MARK: - 自定义方法
    
    /// 设置UI界面
    private func setupUI() {
        
        // 设置titleView
        setupTitleView()
        
        // 设置contentView
        setupContentView()
    }
    
    /// 创建titleView
    private func setupTitleView() {
        
        // 设置titleView的frame(导航条的高度如果由外界决定可能会更好)
        let titleViewFrame = CGRect(x: 0, y: 0, width: kScreenWidth, height: settings.titleViewHeight)
        
        titleView = TitleView(frame: titleViewFrame, titles: titles, settings: settings)
        
        // FIXME: - 调试背景颜色
        titleView.backgroundColor = UIColor.randomColor()
        
        // 将titleView添加到containerView中
        addSubview(titleView)
    }
    
    /// 创建contentView
    private func setupContentView() {
        
        // 设置contentView的frame
        let contentViewFrame = CGRect(x: 0, y: settings.titleViewHeight, width: kScreenWidth, height: bounds.size.height - settings.titleViewHeight)
        
        // 创建contentView
        contentView = ContentView(frame: contentViewFrame, childControllers: childControllers, parentController: parentController!, settings: settings)
        
        // FIXME: - 调试背景颜色
        contentView.backgroundColor = UIColor.randomColor()
        
        // 将contentView添加到containerView中
        addSubview(contentView)
    }
}
