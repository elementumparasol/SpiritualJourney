//
//  AppDelegate.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - 类自带的属性

    var window: UIWindow?

    
    // MARK: - 类自带的方法

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 初始化Realm数据库
        setupRealm()
        
        return true
    }

    /// 安装Realm数据库
    private func setupRealm() {
        
        // 关闭Realm中任何与同步相关的调试信息，以保持控制器清爽
        SyncManager.shared.logLevel = .off
        
//        // 创建Realm实例
//        let realm = try! Realm()
//        
//        // 检查realm是否为空，如果是，则直接return
//        guard realm.isEmpty else { return }
//        
//        // 创建测试数据(将数据写入Realm数据库)
//        try! realm.write {
//            
//            // 将数据添加到Realm中
//            realm.add(ToDoItem("Buy Milk"))
//            realm.add(ToDoItem("Finish Book"))
//            realm.add(ToDoItem("Buy Fruit"))
//        }
    }

}

/// 用于列举Realm所有可能的存储路径
enum ToDoRealmLocation {
    
    // MARK: - 枚举成员列表
    
    /// Bundle路径
    case bundle
    
    /// 普通未加密的路径
    case plain
    
    /// 已加密的路径
    case encrypted
    
    // MARK: - 枚举属性列表
    
    /// 返回文件的URL路径
    var fileURL: URL {
        do {
            switch self {
                
            // 返回文件在Bundle中的路径
            case .bundle:
                return try LocalizedPath.inBundle("Bundle.realm")
                
            // 返回普通未加密的路径
            case .plain:
                return try LocalizedPath.inDocuments("myToDo.realm")
                
            // 返回已经加密的路径
            case .encrypted:
                return try LocalizedPath.inDocuments("myToDoEnc.realm")
            }
        } catch let error {
            fatalError("Failed finding expected path: \(error)")
        }
    }
    
    /// 判断该文件是否存在
    var fileExists: Bool {
        
        // fileExists(atPath : )是Foundation中的一个
        // 方法，用于判断指定的文件路径是否存在
        return FileManager.default.fileExists(atPath: filePath)
    }
    
    /// 将文件的fileURL路径转换为filePath路径
    var filePath: String {
        
        // path是Foundation中的一个get属性
        // 如果URL遵守了RFC1808协议(URL常见形式)
        // 协议，那么最后会返回一个该URL的path路径
        return fileURL.path
    }
}
