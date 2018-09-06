//
//  AppDelegate.swift
//  MyLocations
//
//  Created by Enrica on 2018/8/29.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - 自定义属性
    
    /// 创建NSPersistentContainer实例。它是一个容器，封装了
    /// CoreData Stack(核心数据栈堆)。NSPersistentContainer
    /// 简化了创建和管理的核心堆栈的数据处理创建NSManagedObjectModel，
    /// NSPersistentStoreCoordinator和NSManagedObjectContext
    /// - 懒加载属性在这里主要有三个作用:
    /// - (1)、声明变量persistentContainer
    /// - (2)、对变量调用loadPersistentStores方法进行初始化
    /// - (3)、将上面所有的操作关联到一起
    lazy var persistentContainer: NSPersistentContainer = {
        
        // 通过指定的名称"DataModel"，从mainBundle中创建容器container
        let container = NSPersistentContainer(name: "DataModel")
        
        // 将数据从数据库中加载到内存，并且设置Core Data栈
        container.loadPersistentStores(completionHandler: {
            storeDescription, error in
            if let error = error {
                fatalError("Could load data store: \(error)")
            }
        })
        return container
    }()
    
    /// 用于对CoreData执行一列的操作(包括创建和存取操作)
    lazy var managedObjectContext: NSManagedObjectContext =
        self.persistentContainer.viewContext

    
    
    // MARK: - AppDelegate自带的方法

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 取出tabBarController
        let tabBarController = window!.rootViewController as! UITabBarController
        
        // 取出tabBarController里面的viewControllers
        if let tabViewControllers = tabBarController.viewControllers {
            
            // 取出导航控制器
            let navController = tabViewControllers[0] as! UINavigationController
            
            // 取出CurrentLocationViewController
            let controller = navController.viewControllers.first as! CurrentLocationViewController
            
            // 将AppDelegate中的managedObjectContext传递
            // 给CurrentLocationViewController中的managedObjectContext
            controller.managedObjectContext = managedObjectContext
        }
        
        
        
        
        
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

