//
//  UINavigationController+Extension.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    // childForStatusBarStyle是UIViewController的属性，它默认
    // 是指向UINavigationController的，其作用就是用来检测控制器状
    // 态栏样式的。而topViewController则表示为导航堆栈最顶部的那
    // 个控制器，通过返回topViewController就可以让childForStatusBarStyle
    // 属性指向当前显示在我们眼前的这个控制器，也就是说，当我们在当前这
    // 个控制器中重写preferredStautsBarStyle属性时，系统不再使用导
    // 航控制器的状态栏样式，而是使用我们在当前控制器中自定义的这个样式
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
