//
//  AppDelegate.swift
//  HimalayanFM
//
//  Created by Enrica on 2018/10/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - 类自带的属性
    
    var window: UIWindow?
    
    // MARK: - 自定义方法
    
    /// 自定义应用程序外观
    private func customizeAppearence() {
        
        // 自定义tabBar的外观
        customizeTabBar()
    }
    
    /// 自定义tabBar的外观
    private func customizeTabBar() {
        
        /**
         * 1、调整tabBar的外观
         */
        
        // 设置tabBar的tintColor
        UITabBar.appearance().tintColor = UIColor(r: 246, g: 101, b: 73)
        
        // 设置tabBar的背景图片 tabbar_bg_320x49_
        UITabBar.appearance().backgroundImage = UIImage.resizableImage(with: "tabbar_bg_320x49_")
        
        // 禁用tabBar的透明效果
        UITabBar.appearance().isTranslucent = false
        
        
        /**
         * 2、调整tabBarItem的外观
         */
        
        // 调整tabBarItem字体的大小
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        
        // 调整tabBarItem上面title和image的间距
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
    }
    
    private func customizeNavigationBar() {
        
        //
    }
    
    // MARK: - 类自带的方法

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 自定义应用程序的外观
        customizeAppearence()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       //
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //
    }


}

