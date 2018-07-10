//
//  ViewController.swift
//  位置动画
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// redView
    fileprivate lazy var redView: UIView = {
        
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        redView.backgroundColor = .red
        return redView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将redView添加到控制器的view上
        view.addSubview(redView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置动画执行周期
        UIView.setAnimationDuration(1.5)
        
        // 设置位置动画
        redView.center = view.center
        
        // 提交动画
        UIView.commitAnimations()
    }

    // 使用UIView的animate(withDuration: , animations: )方法来执行动画更简单
}

