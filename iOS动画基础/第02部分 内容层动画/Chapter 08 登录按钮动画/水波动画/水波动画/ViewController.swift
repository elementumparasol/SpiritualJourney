//
//  ViewController.swift
//  水波动画
//
//  Created by Enrica on 2018/7/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 登录按钮
    private lazy var loginButton: AnimationButtom = {
        
        // 创建按钮对象
        let button = AnimationButtom(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width - 2 * 20, height: 44)))
        
        // 设置按钮的背景颜色
//        button.backgroundColor = .red
        
        // 设置按钮的圆角
//        button.layer.masksToBounds = true
//        button.layer.cornerRadius = 5
        
        // 设置按钮普通状态下的文字
//        button.setTitle("登录", for: .normal)
        
        // 设置按钮高亮状态下的文字
//        button.setTitle("登录中", for: .highlighted)
        
        // 设置按钮高亮状态下的文字颜色
//        button.setTitleColor(.lightGray, for: .highlighted)
        
        // 监听登录按钮的点击
        button.addTarget(self, action: #selector(ViewController.loginButtonClick(_:_:)), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置按钮的位置
        loginButton.center = view.center
        
        // 将按钮添加到当前控制器的view上
        view.addSubview(loginButton)
    }


}

extension ViewController {
    
    
    /// 监听按钮的点击
    ///
    /// - Parameters:
    ///   - button: 按钮
    ///   - event: 事件
    @objc func loginButtonClick(_ button: UIButton, _ event: UIEvent) {
        
        // 播放水波动画
        print("loginButtonClick(_:_:)")
    }
}
