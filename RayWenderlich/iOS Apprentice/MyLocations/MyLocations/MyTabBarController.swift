//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/9.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    // 设置状态栏的颜色为lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // 通过重写childForStatusBarStyle属性并返回nil，这样
    // tabBar就会使用preferredStatusBarStyle中设置的值
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
