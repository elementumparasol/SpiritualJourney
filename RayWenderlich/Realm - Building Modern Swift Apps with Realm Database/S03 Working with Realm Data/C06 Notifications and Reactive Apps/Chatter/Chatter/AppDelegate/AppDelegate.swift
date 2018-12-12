//
//  AppDelegate.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - 类自带的属性
    
    var window: UIWindow?
    
    
    // MARK: - 自定义属性
    
    /// 获取ChatAPI接口
    private let api = ChatAPI()

    
    // MARK: - 类自带的方法

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 从ChatAPI中返回相应的信息
        api.connect { [unowned self] newMessages in
            
            // 将从API中返回的信息保存到Realm数据库中
            self.persist(messages: newMessages)
        }
        
        return true
    }

    // MARK: - 自定义方法
    
    /// 将messages消息保存到Realm中
    ///
    /// - Parameter messages: 从ChatAPI接口中返回的消息
    private func persist(messages: [(String, String)]) {
        
        // 打印messages消息
        // print(messages)
        
        // 关闭Realm中任何与同步相关的调试信息，以保持控制器清爽
        SyncManager.shared.logLevel = .off
        
        // 在后台异步执行
        DispatchQueue.global(qos: .background).async {
            
            // 将从服务器返回的消息转换为Realm对象
            let objects = messages.map { message in
                
                // 返回消息对象中的内容(消息发送者和内容)
                return Message(from: message.0, text: message.1)
            }
            
            // 使用默认配置获取Realm数据库
            let realm = try! Realm()
            
            // 在指定的闭包中执行相应的操作
            try! realm.write {
                
                // 将Message对象objects保存到Realm数据库中
                realm.add(objects)
            }
        }
    }
    
}

