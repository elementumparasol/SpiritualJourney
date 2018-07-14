//
//  ViewController.swift
//  路径动画
//
//  Created by Enrica on 2018/7/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// blueView
    private lazy var blueView: UIView = {
        
        let view = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将blueView添加到当前控制器的view上
        view.addSubview(blueView)
        
        // 执行动画
        displayAnimation()
    }

    private func displayAnimation() {
        
        // 创建路径
        let pathLine = CGMutablePath()
        pathLine.move(to: CGPoint(x: 90, y: 90))
        pathLine.addLine(to: CGPoint(x: 300, y: 250))
        
        // 创建CAKeyframeAnimation对象
        let animation = CAKeyframeAnimation()
        
        // 设置动画执行时长
        animation.duration = 5
        
        // 设置动画路径
        animation.path = pathLine
        
        // 设置动画的keyPath
        animation.keyPath = "position"
        
        // 设置动画执行完成之后的状态
        animation.fillMode = .forwards
        
        // 设置动画执行完成之后是否需要从layer上移除
        animation.isRemovedOnCompletion = false
        
        // 将动画添加到blueView的layer上
        blueView.layer.add(animation, forKey: nil)
    }
}

