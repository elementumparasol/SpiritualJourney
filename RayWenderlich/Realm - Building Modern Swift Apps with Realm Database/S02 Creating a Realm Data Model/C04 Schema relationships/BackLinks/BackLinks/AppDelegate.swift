//
//  AppDelegate.swift
//  BackLinks
//
//  Created by Enrica on 2018/12/5.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - 类自带的属性
    
    var window: UIWindow?
    
    
    // MARK: - 自定义方法
    
    func testBackLinks() {
        
        let realm = try! Realm(configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true))
        SyncManager.shared.logLevel = .off
        
        
        let myLittleShop = RepairShop("My Little shop")
        let car = Car(brand: "BMW", year: 1980)
        car.shop = myLittleShop
        
        
        try! realm.write {
            realm.add(car)
            realm.add(myLittleShop)
        }
        
        
        print("Cars maintained at \(myLittleShop.name)")
        print(myLittleShop.maintainedCars)
    }
    
    
    // MARK: - 类自带的方法

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        testBackLinks()
        
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

