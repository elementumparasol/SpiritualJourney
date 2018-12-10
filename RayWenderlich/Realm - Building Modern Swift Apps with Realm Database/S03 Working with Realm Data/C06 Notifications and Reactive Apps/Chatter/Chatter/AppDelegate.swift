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
    
    /// API接口
    private let api = ChatAPI()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        api.connect { [unowned self] newMessages in
            self.persist(messages: newMessages)
        }
        
        return true
    }

    private func persist(messages: [(String, String)]) {
        // Persist a list of messages to database
        print(messages)
        
        SyncManager.shared.logLevel = .off
        
        DispatchQueue.global(qos: .background).async {
            let objects = messages.map { message in
                return Message(from: message.0, text: message.1)
            }
            let realm = try! Realm()
            try! realm.write {
                realm.add(objects)
            }
        }
    }
    
}

