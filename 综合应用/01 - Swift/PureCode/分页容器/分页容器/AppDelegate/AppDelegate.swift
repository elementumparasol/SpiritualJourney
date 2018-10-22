//
//  AppDelegate.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - 类自带的属性

    var window: UIWindow?
    

    // MARK: - 类自带的方法
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 创建主窗口，并设置窗口的frame
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 创建窗口的根控制器
        window?.rootViewController = MainViewController()
        
        // FIXME: - 调试颜色
        window?.backgroundColor = .white
        
        // 显示窗口
        window?.makeKeyAndVisible()
        
        
        
        // 设置tabBar的tintColor
        UITabBar.appearance().tintColor = UIColor(r: 246, g: 101, b: 73)
        
        // 设置tabBar的背景图片
        UITabBar.appearance().backgroundImage = UIImage.resizableImage(with: "tabbar_bg_320x49_")
        
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

