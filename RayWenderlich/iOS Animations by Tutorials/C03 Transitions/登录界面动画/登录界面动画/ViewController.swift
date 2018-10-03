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
    
    
    // MARK: - 自定义属性
    
    /// 容器控件(animation container)
    var animationContainerView: UIView!
    
    /// 菊花儿
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    /// 显示状态的图片
    let status = UIImageView(image: UIImage(named: "banner"))
    
    /// 显示状态的文本控件
    let label = UILabel()
    
    /// 状态信息
    let messages = ["连接中 ...", "正在获取授权...", "正在认证...", "登陆失败"]
    
    /// 菊花位置
    var statusPosition = CGPoint.zero
    
    
    // MARK: - 类自带的方法
    
    // 控制器的view加载到内存之后调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置容器控件(animation container)
//        animationContainerView = UIView(frame: view.bounds)
//        animationContainerView.backgroundColor = .red
//        view.addSubview(animationContainerView)
        
        /**
         设置菊花的位置
         */
        
        // 设置菊花的位置和尺寸
        spinner.frame = CGRect(x: -20, y: 6, width: 20, height: 20)
        
        // 开始转菊花
        spinner.startAnimating()
        
        // 设置菊花默认为隐藏
        spinner.alpha = 1
        
        // 将菊花添加到登录按钮上
        loginButton.addSubview(spinner)
        
    }
    
    // 控制器的view即将添加到视图层次结构中时调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 标题、用户名输入框和密码输入框在界面显示
        // 之前，先将其移动到屏幕外面
        titleLabel.center.x -= view.bounds.width
        usernameTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
        
        
        // 修改登录按钮中心点y的坐标，并且修改它的透明度
        loginButton.center.y += 30
        loginButton.alpha = 0.0
    }
    
    // 控制器的view已经添加到视图层次结构中之后调用
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 给标题文本添加动画
        UIView.animate(withDuration: 0.5) {
            self.titleLabel.center.x += self.view.bounds.width
        }
        
        // 给用户名输入框添加动画(延迟0.3s)
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.usernameTextField.center.x += self.view.bounds.width
        }, completion: nil)
        
        // 给密码输入框添加动画(延迟0.4s)
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.passwordTextField.center.x += self.view.bounds.width
        }, completion: nil)
        
        
        // 给登陆按钮添加动画
        // 参数usingSpringWithDamping表示弹性系数，它的取值范围是
        // 0.0~1.0，越接近0.0，弹性越强；越接近1.0，弹性越弱(僵硬)
        // 参数initialSpringVelocity表示弹性动画的初始速度，一般情
        // 况下，取值范围也应该保持在0.0~1.0之内，并且数值越大表示初始
        // 速度越高
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.center.y -= 30
            self.loginButton.alpha = 1.0
        }, completion: nil)
        
        /*
        // 创建bannerView
        let bannerView = UIImageView(image: UIImage(named: "banner"))
        bannerView.center = animationContainerView.center
        
        // 添加bannerView并设置动画效果
        UIView.transition(with: animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.animationContainerView.addSubview(bannerView)
        }, completion: nil)
        
        // 移除bannerView
        UIView.transition(with: animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            bannerView.removeFromSuperview()
        }, completion: nil)
        */
        
    }
    
    
    // MARK: - @IBAction
    
    /// 点击登录按钮时调用
    @IBAction func login() {
        
        // 点击登录按钮之后，整个按钮变宽
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.bounds.size.width += 80
        }, completion: nil)
        
        // 移动登录按钮中心点的y值，以及修改它的背景颜色
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.center.y += 60
            self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
        }, completion: nil)
    }
    
}

