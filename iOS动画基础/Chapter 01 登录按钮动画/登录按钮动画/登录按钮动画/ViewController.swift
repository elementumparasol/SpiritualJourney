//
//  ViewController.swift
//  登录按钮动画
//
//  Created by Enrica on 2018/7/9.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 控件属性
    
    /// 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 执行动画的两种方式: 1、手动提交动画(步骤稍微多一点，尽量少用); 2、直接使用闭包方法(推荐使用)
        
        /*
         手动提交动画
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置动画周期
        UIView.setAnimationDuration(1)
        
        // 设置动画位置
        loginButton.frame = CGRect(x: loginButton.frame.width, y: loginButton.frame.origin.y, width: loginButton.frame.width, height: loginButton.frame.height)
        
        // 提交动画
        UIView.commitAnimations()
        */
        
        // 通过闭包来执行动画
        UIView.animate(withDuration: 1) {
            self.loginButton.frame = CGRect(x: self.loginButton.frame.width, y: self.self.loginButton.frame.origin.y, width: self.loginButton.frame.width, height: self.loginButton.frame.height)
        }
    }

}

