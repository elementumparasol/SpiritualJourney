//
//  SetupViewController.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

class SetupViewController: UIViewController {
    
    // MAKR: - 自定义属性
    
    /// 用于表示是否设置密码
    var isSetPassword = false
    
    // MARK: - 类自带的方法
    
    // 当前试图控制器显示到屏幕上以后调用
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 在当前控制器显示以后
        detectConfiguration()
    }
    
    
    // MARK: - 自定义方法
    
    /// 使用未加密的文件
    private func detectConfiguration() {
        
//        // 设置默认的配置
//        Realm.Configuration.defaultConfiguration = Realm.Configuration(fileURL: RealmLocation.plain.realmUrl)
//
//        if isSetPassword {
//            encryptRealm()
//        } else {
//            // 加载指定的导航控制器控制器
//            showToDoListController()
//        }
        
        if RealmLocation.encrypted.fileExists {
            askForPassword()
        } else {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(fileURL: RealmLocation.plain.realmUrl)
            
            showToDoListController()
        }
    }
    
    /// 对Realm数据库进行加密
    private func encryptRealm() {
        
        userInputAlert("Create a password to encrypt your to do list") { [weak self] (password) in
            
            autoreleasepool {
                
                // 创建配置信息
                let plainConfig = Realm.Configuration(fileURL: RealmLocation.plain.realmUrl)
                
                // 根据配置信息创建Realm实例
                let realm = try! Realm(configuration: plainConfig)
                
                // 将realm复制到指定的位置，并且对其进行加密
                try! realm.writeCopy(toFile: RealmLocation.encrypted.realmUrl, encryptionKey: password.sha512)
            }
            
            // 删除旧的Realm数据库
            do {
                
                let files = FileManager.default.enumerator(at: try LocalizedPath.documents(), includingPropertiesForKeys: [])!
                
                for file in files.allObjects {
                    guard let url = file as? URL, url.lastPathComponent.hasPrefix("mytodo.") else {
                        continue
                    }
                    
                    try FileManager.default.removeItem(at: url)
                }
                
                
            } catch let error {
                fatalError("Failed deleting unencrypted Realm: \(error)")
            }
            
            
            self?.detectConfiguration()
        }
    }
    
    /// 显示ToDoListController控制器的导航控制器
    private func showToDoListController() {
        
        // 根据storyboard标识符初始化指定的控制器
        let listController = storyboard!.instantiateViewController(withIdentifier: "ToDoNavigationController")
        
        // 创建控制器转场动画
        UIView.transition(with: view.window!, duration: 0.33, options: .transitionFlipFromLeft, animations: {
            
            // 将listController设置为当前窗口的根控制器
            self.view.window!.rootViewController = listController
        }, completion: nil)
    }

    ///
    private func askForPassword() {
        
        userInputAlert("Enter a password to open the encrypted todo file", isSecure: true) { [weak self] password in
            self?.openRealm(with: password)
        }
    }
    
    /// 使用密码打开Realm数据库
    ///
    /// - Parameter password: 打开数据库的密码
    private func openRealm(with password: String) {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            fileURL: RealmLocation.encrypted.realmUrl,
            encryptionKey: password.sha512
        )
        
        do {
            _ = try Realm()
            showToDoListController()
        } catch let error as NSError {
            print(error.localizedDescription)
            askForPassword()
        }
    }
    
    
}
