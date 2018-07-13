//
//  ViewController.swift
//  位置动画
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建redView
    private lazy var redView: UIView = {
        
        let redView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        redView.backgroundColor = .red
        return redView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置redView的初始位置
        redView.center.x = view.center.x
        
        // 将redView添加到当前控制器的view上
        view.addSubview(redView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 创建CABasicAnimation对象
        let animation = CABasicAnimation()
        
        // 设置animation的keyPath
        animation.keyPath = "position"
        
        // 设置positionX
        let positionX = redView.center.x
        
        // 设置positionY
        let positionY = view.frame.size.height - redView.frame.size.height * 0.5
        
        // 设置Animation的toValue
        animation.toValue = CGPoint(x: positionX, y: positionY)
        
        // 设置动画执行时长
        animation.duration = 2
        
        // 设置动画的fillMode
        animation.fillMode = .forwards
        
        // 动画执行完成以后是否从layer上移除
        animation.isRemovedOnCompletion = false
        
        // 将动画添加到redView的layer上面
        redView.layer.add(animation, forKey: nil)
    }
}

