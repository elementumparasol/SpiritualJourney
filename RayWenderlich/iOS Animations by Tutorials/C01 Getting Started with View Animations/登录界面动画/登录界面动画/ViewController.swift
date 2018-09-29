//
//  ViewController.swift
//  登录界面动画
//
//  Created by Enrica on 2018/9/29.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 用户名
    @IBOutlet weak var usernameTextField: UITextField!
    
    /// 密码
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    
    /// 云彩1
    @IBOutlet weak var leftTopCloud: UIImageView!
    
    /// 云彩2
    @IBOutlet weak var rightTopCloud: UIImageView!
    
    /// 云彩3
    @IBOutlet weak var leftBottomCloud: UIImageView!
    
    /// 云彩4
    @IBOutlet weak var rightBottomCloud: UIImageView!
    
    
    // MARK: - 类自带的方法
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 标题、用户名输入框和密码输入框在界面显示
        // 之前，先将其移动到屏幕外面
        titleLabel.center.x -= view.bounds.width
        usernameTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 给标题文本添加动画
        UIView.animate(withDuration: 0.5) {
            self.titleLabel.center.x += self.view.bounds.width
        }
        
        // 给用户名输入框添加动画
        UIView.animate(withDuration: 0.5) {
            self.usernameTextField.center.x += self.view.bounds.width
        }
        
        // 给密码输入框添加动画
        UIView.animate(withDuration: 0.5) {
            self.passwordTextField.center.x += self.view.bounds.width
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

