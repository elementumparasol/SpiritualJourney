//
//  AppDelegate.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - 自定义属性
    
    /// dataModel属性。在AppDelegate里面创建DataModel对象
    /// AppDelegate可以将DataModel对象传递给任何需要用它的控制器
    let dataModel = DataModel()
    
    // MARK: - 保存应用数据
    
    /// 保存应用数据。AppDelegate会发出所有和应用状态(比如说退出、进入后台、
    /// 被杀死等)相关的消息，所以在这里面保存应用数据是最安全有效的 
    func saveData() {
        
        // 保存应用数据
        dataModel.saveChecklists()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - 处理应用数据
        
        // 获取导航控制器(也就是根控制器)
        let navigationController = window!.rootViewController as! UINavigationController
        
        // 通过导航控制器拿到主控制器AllListsViewController
        let controller = navigationController.viewControllers[0] as! AllListsViewController
        
        // 将应用数据传递给AllListsViewController
        controller.dataModel = dataModel
        
        
        // MARK: - 处理本地通知
        
        // 获取本地通知权限
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
            if granted {
                print("We have permission")
            } else {
                print("Permission denied")
            }
        }
        
        // 通知内容
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "I am a local notification"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "MyNotification", content: content, trigger: trigger)
        center.add(request)
        
        // 让AppDelegate成为UNUserNotificationCenter的代理
        center.delegate = self
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // 在应用程序进入后台时，及时保存数据
        saveData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        // 在应用程序即将被杀死时，及时保存数据
        saveData()
    }


}



// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    /// 监听在前台运行的本地通知
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Receive local notification \(notification)")
    }
}
