//
//  AppDelegate.swift
//  控制器转场动画
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// 调整tabBar的相关属性
    private func initialWithTabBarAttribues() {
        
        // 设置tabBar的tintColor
        UITabBar.appearance().tintColor = UIColor(r: 234, g: 26, b: 34)
        
        // 设置UITabBar的背景图片
        UITabBar.appearance().backgroundImage = UIImage.imageWithStretchalbe("tabbar_bg_319x49_")
        UITabBar.appearance().isTranslucent = false  // 取消半透明效果
        
        // 设置tabBar标题文字大小
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .normal)
        
        // 调整tabBar标题和图片之间的位置(标题太低了，让它网上lu挪动3个位置)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
    }
    
    /// 初始化导航条的相关设置
    private func initialWithNavigationBarAttributes() {
        
        // 设置导航栏的背景图片
        UINavigationBar.appearance().setBackgroundImage(UIImage.imageWithStretchalbe("nav_bg_375x64_"), for: .any, barMetrics: .default)
        
        // 去掉导航栏底部的分割线
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 初始化tabBar
        initialWithTabBarAttribues()
        
        // 初始化导航条
        initialWithNavigationBarAttributes()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

