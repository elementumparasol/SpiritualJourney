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
        
        // 设置默认的配置
        Realm.Configuration.defaultConfiguration = Realm.Configuration(fileURL: RealmLocation.plain.realmUrl)
        
        // 加载指定的导航控制器控制器
        showToDoListController()
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

}
