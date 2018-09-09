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
    
    
    
    // MARK: - 自定义方法
    
    /// 监听通知中心发出的和CoreData存储错误相关的通知
    func listenForFatalCoreDataNotifications() {
        
        // 监听名为CoreDataSaveFailedNotification的通知
        NotificationCenter.default.addObserver(forName: CoreDataSaveFailedNotification, object: nil, queue: OperationQueue.main, using: { notification in
            
            // 输出错误消息和提示
            let message = """
                           Core Data在存储数据的过程中发生了严重的错误！
                           点击"OK"退出程序。对使用过程中造成的不便表示抱歉。
                          """
            
            // 创建UIAlertController实例，用于展示错误信息
            let alert = UIAlertController(title: "内部错误", message: message, preferredStyle: .alert)
            
            // 创建action按钮
            let action = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                
                // 利用NSException创建详细崩溃日志
                // NSException比fatalError更好用
                let exception = NSException(name: NSExceptionName.internalInconsistencyException, reason: "Core Data发生严重错误", userInfo: nil)
                
                exception.raise()
            })
            
            // 将action添加到alert中
            alert.addAction(action)
            
            // 拿到tabBarController
            let tabController = self.window!.rootViewController!
            
            // 弹出alert控制器
            tabController.present(alert, animated: true, completion: nil)
        })
    }

    /// 自定义应用外观
    func customizeAppearance() {
        
        // 设置导航条的背景颜色
        UINavigationBar.appearance().barTintColor = UIColor.black
        
        // 设置导航条标题的颜色
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        // 设置tabBar的背景颜色
        UITabBar.appearance().barTintColor = UIColor.black
        
        // 自定义颜色
        let tintColor = UIColor(red: 255/255.0, green: 238/255.0, blue: 136/255.0, alpha: 1.0)
        
        // 设置tabBar上面item的标题颜色
        UITabBar.appearance().tintColor = tintColor
    }
    
    // MARK: - AppDelegate自带的方法

    // 应用程序启动完毕之后调用
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 取出tabBarController
        let tabBarController = window!.rootViewController as! UITabBarController
        
        // 取出tabBarController里面的viewControllers
        if let tabViewControllers = tabBarController.viewControllers {
            
            /**
             1、将managedObjectContext传递给CurrentLocationViewController
             */
            
            // 取出下标为0的导航控制器
            var navController = tabViewControllers[0] as! UINavigationController
            
            // 取出CurrentLocationViewController
            let controller = navController.viewControllers.first as! CurrentLocationViewController
            
            // 将AppDelegate中的managedObjectContext传递
            // 给CurrentLocationViewController中的managedObjectContext
            controller.managedObjectContext = managedObjectContext
            
            
            /**
             2、将managedObjectContext传递给LocationsViewController
             */
            
            
            // 取出下标为1的导航控制器
            navController = tabViewControllers[1] as! UINavigationController
            
            // 取出LocationsViewController
            let locationsController = navController.viewControllers.first as! LocationsViewController
            
            // 将managedObjectContext传递给LocationsViewController
            // 中的managedObjectContext
            locationsController.managedObjectContext = managedObjectContext
            
            // 提前加载LocationsViewConroller的view
            // 主要是为了修复在插入新的location数据时，
            // Locations这个tableView中数据不能及时显示的but
            let _ = locationsController.view
            
            
            /**
             3、将managedObjectContext传递给LocationsViewController
             */
            
            // 取出下标为2的导航控制器
            navController = tabViewControllers[2] as! UINavigationController
            
            // 取出MapViewController
            let mapController = navController.viewControllers.first as! MapViewController
            
            // 将managedObjectContext传给MapViewController
            mapController.managedObjectContext = managedObjectContext
        }
        
        // print(applicationDocumentsDirectory)
        
        // 监听通知中心发出的通知
        listenForFatalCoreDataNotifications()
        
        // 自定义应用程序外观
        customizeAppearance()
        
        return true
    }

    // 应用程序即将失去活跃状态的时候调用
    func applicationWillResignActive(_ application: UIApplication) {
        // print("--- applicationWillResignActive ---")
    }

    // 应用程序已经进入后台的时候调用
    func applicationDidEnterBackground(_ application: UIApplication) {
        // print("--- applicationDidEnterBackground ---")
        
        
        
    }

    // 应用程序即将回到前台的时候调用
    func applicationWillEnterForeground(_ application: UIApplication) {
        // print("--- applicationWillEnterForeground ---")
    }

    // 应用程序进入活跃状态的时候调用
    func applicationDidBecomeActive(_ application: UIApplication) {
        // print("--- applicationDidBecomeActive ---")
    }

    // 应用程序即将退出的时候调用
    func applicationWillTerminate(_ application: UIApplication) {
        // print("--- applicationWillTerminate ---")
    }

}

/**
 一、程序启动时依次调用的方法为:
    didFinishLaunchingWithOptions
    applicationDidBecomeActive
 
 二、按住Home键，让程序退出前台进入后台:
    applicationWillResignActive
    applicationDidEnterBackground
 
 三、再次让程序进入前台:
    applicationWillEnterForeground
    applicationDidBecomeActive
 
 四、退出程序:
    applicationWillResignActive
    applicationDidEnterBackground
    applicationWillTerminate
 */
