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
    private lazy var loginButton: AnimationButton = {
        
        // 创建按钮的frame
        let buttonFrame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width - 2 * 20, height: 44))
        
        // 创建按钮对象
        let button = AnimationButton(frame: buttonFrame, normalTitle: "登录", highlightedTitle: "登录中...", normalTitleColor: .white, highlightedTitleColor: .lightGray)
        
        // 设置按钮的背景颜色
        button.backgroundColor = .red
        
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


// MARK: - 监听事件的点击
extension ViewController {
    
    
    /// 监听按钮的点击
    ///
    /// - Parameters:
    ///   - button: 当前被点击的按钮
    ///   - event: 当前按钮点击事件
    @objc func loginButtonClick(_ button: UIButton, _ event: UIEvent) {
        
        // 将按钮转换为真实类型AnimationButton
        let btn = button as! AnimationButton
        
        // 将按钮和事件传递过去，以便播放水波动画
        btn.startWaveAnimation(button, event: event)
    }
}
