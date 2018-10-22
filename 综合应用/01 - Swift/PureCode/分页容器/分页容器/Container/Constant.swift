//
//  Constant.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * 常用的一些常量值
 */

import UIKit


/// 屏幕宽度
let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width

/// 屏幕高度
let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height

/// 导航条的高度
let kNavigationBarHeight: CGFloat = 44.0

/// tabBar的高度
let kTabBarHeight: CGFloat = 49.0

/// 如果屏幕高度大于等于812，就说明是残缺屏
let isStupidScreen = kScreenHeight >= 812 ? true : false



/// 状态栏的高度
let kStatusBarHeight: CGFloat = isStupidScreen ? 44 : 20

/// 底部安全区域的高度
let kSafeAreaInsetsBottom: CGFloat = isStupidScreen ? 34: 0
