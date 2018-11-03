//
//  AppDelegate.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - 自定义方法
    
    private func customizeAppearence() {
        
        // 统一设置导航条上面的返回按钮背景图片
        let backButtonImage = UIImage(named: "back-icon")
        UINavigationBar.appearance()
            .backIndicatorImage = backButtonImage
        UINavigationBar.appearance()
            .backIndicatorTransitionMaskImage = backButtonImage
        
        // 自定义tabBar
        UITabBar.appearance().tintColor = UIColor(r: 235, g: 75, b: 27)
        // UITabBar.appearance().barTintColor = .black
    }
    
    
    // MARK: - 类自带的方法

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        customizeAppearence()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // 保存用户数据
        saveContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    
    // MARK: - 在程序结束之前保存数据

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        // 使用Core Data保存数据
        saveContext()
    }
    
    
    // MARK: - Core Data堆栈
    
    // 应用程序持久化的容器，主要用于和CoreData Stack进行交互
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "FoodPin")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data保存数据的方法
    
    /// 该方法主要是帮助用户通过CoreData来保存数据
    /// 当我们需要在持久化的存储容器中插入、更新和删
    /// 除数据时，就需要在合适的位置调用此方法
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

