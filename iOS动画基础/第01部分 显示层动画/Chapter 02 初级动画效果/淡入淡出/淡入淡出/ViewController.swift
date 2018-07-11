//
//  ViewController.swift
//  淡入淡出
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// 创建redView
    fileprivate lazy var redView: UIView = {
        
        let redView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        redView.backgroundColor = .red
        redView.alpha = 0
        return redView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改redView的中心点x的值
        redView.center = view.center
        
        // 将redView添加到当前控制器的view上
        view.addSubview(redView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置动画执行周期
        UIView.setAnimationDuration(2)
        
        // 设置动画属性
        redView.alpha = 1
        
        // 提交动画
        UIView.commitAnimations()
    }

}

