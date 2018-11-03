//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController {
    
    // MARK: - 自定义属性
    
    /// 标题
    var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    
    /// 图片名称
    var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    /// 副标题
    var pageSubHeadings = ["Pin your favorite restaurants and create your own food guide", "Search and locate your favourite restaurant on Maps", "Find restaurants shared by your friends and other foodies"]
    
    /// 当前页的下标值
    var currentIndex = 0
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置数据源代理。将当前控制器设置为自己的数据源
        dataSource = self
        
        // 当PageViewController加载到内存以后，创建第一个walkthrough页面
        if let startingViewController = contentViewController(at: 0) {
            
            // 设置要显示的视图控制器
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    
    // MARK: - 自定义方法
    
    /// 根据指定的下标返回一个控制器
    ///
    /// - Parameter index: 指定控制器的下标值
    /// - Returns: 如果指定的下标值合法，则返回该下标所对应的控制器
    private func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        
        // 对index的值进行校验，确保index是合法的
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // 通过名称从Bundle中加载指定的storyboard
        let storyboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        
        // 根据指定的标识符来初始化storyboard控制器
        if let pageContentViewController = storyboard
            .instantiateViewController(withIdentifier: "WalkthroughContentViewController") as?
            WalkthroughContentViewController {
            
            // 给初始化成功的控制器设置相应的数据
            pageContentViewController.imageName = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            // 将控制器进行返回
            return pageContentViewController
        }
        
        return nil
    }
    
    /// 切换到下一个控制器页面
    func forwardPage() {
        
        // 获取下一个控制器对应的index
        currentIndex += 1
        
        // 根据指定的index获取下一个控制器
        if let nextViewController = contentViewController(at: currentIndex) {
            
            // 显示指定的控制器
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
}


// MARK: - UIPageViewControllerDataSource
extension WalkthroughPageViewController: UIPageViewControllerDataSource {
    
    // 这个协议方法是必须实现的，它返回当前视图控制器前面一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 获取当前控制器的下标值
        var index = (viewController as! WalkthroughContentViewController).index
        
        // 获取当前控制器前面一个控制器的下标值
        index -= 1
        
        // 根据索引值返回当前控制器前面一个控制器
        return contentViewController(at: index)
    }
    
    //  这个协议方法是必须实现的，它返回当前视图控制器后面一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 获取当前控制器的下标值
        var index = (viewController as! WalkthroughContentViewController).index
        
        // 获取当前控制器后面一个控制器的下标值
        index += 1
        
        // 根据给定的索引返回当前控制器后面一个控制器
        return contentViewController(at: index)
    }
    
    
}
