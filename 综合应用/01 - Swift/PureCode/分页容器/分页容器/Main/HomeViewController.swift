//
//  HomeViewController.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// 导航栏高度
    private var navigationBarHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 设置UI界面
        setupUI()
        
        // 获取导航栏的高度
        if let height = navigationController?.navigationBar.frame.size.height {
            navigationBarHeight = height
        }
        
        
    }
    
    deinit {
        print("HomeViewController --- 控制器被销毁")
    }
    
    /// 初始化UI界面
    private func setupUI() {
        
        /**
         * 1、containerView的frame
         */
        
        // containerView的y值
        let containerY = kStatusBarHeight + navigationBarHeight
        
        // containerView的高度。分别减去状态栏高度、导航栏高度、tabBar高度，
        // 以及，如果是智障屏，则还需减去tabBar底部安全区的高度
        let containerViewHeight = kScreenHeight - kStatusBarHeight - navigationBarHeight - kTabBarHeight - kSafeAreaInsetsBottom
        
        // 指定containerView的frame
        let containerFrame = CGRect(x: 0, y: containerY, width: kScreenWidth, height: containerViewHeight)
        
        
        /**
         * 2、按钮的标题或者图片的URL字符串
         */
        
        // 可以滚动的标题
        //let titles = ["推荐", "VIP", "小说", "直播", "儿童", "广播", "精品", "相声", "人文", "历史", "段子", "音乐"]
        // 不可滚动的标题
        let titles2 = ["关注", "推荐", "附近", "活动", "游戏"]
        
        // 标题图片的URL字符串
        //let imageURLStrings: [String] = []
        
        
        /**
         * 3、settings的一些初始化设置
         */
        
        let settings = Settings()
        
        
        /**
         * 4、所有的子控制器
         */
        
        // 所有的子控制器
        var childVcs: [UIViewController] = []
        
        // 子控制器
        for _ in 0..<titles2.count {
            
            let vc = UIViewController()
            
            // FIXME: - 调试颜色
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        
        /**
         * 5、创建ContainerView实例
         */
        
        let containerView = ContainerView(frame: containerFrame, titles: titles2, settings: settings, childControllers: childVcs, parentController: self)
        
        
        // FIXME: - 调试颜色
        containerView.backgroundColor = .blue
        
        
        // 将containerView添加到当前控制器的view上面
        view.addSubview(containerView)
    }

}
