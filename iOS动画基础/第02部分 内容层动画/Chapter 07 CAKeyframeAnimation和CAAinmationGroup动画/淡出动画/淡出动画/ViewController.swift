//
//  ViewController.swift
//  淡出动画
//
//  Created by Enrica on 2018/7/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建blueView
    private lazy var blueView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置blueView的位置
        blueView.center = view.center
        
        // 将blueView添加到当前控制器的view上
        view.addSubview(blueView)
        
        // 播放动画
        displayAnimation()
    }

    /// 播放动画效果
    private func displayAnimation() {
        
        // 创建CAKeyframeAnimation对象
        let animation = CAKeyframeAnimation()
        
        // 设置动画执行时长
        animation.duration = 5
        
        // 设置animation的keyPath(动画执行样式)
        animation.keyPath = "opacity"
        
        // 创建动画的值values
        let valuesArray = [0.95, 0.85, 0.75, 0.65, 0.55, 0.45, 0.35, 0.25, 0.15, 0.05]
        
        // 设置animation的values
        animation.values = valuesArray
        
        // 设置fillMode的值为forwards, 即表示保留动画结束的最后状态
        animation.fillMode = .forwards
        
        // 设置动画执行完成之后是否从layer上面移除
        animation.isRemovedOnCompletion = false
        
        // 将动画添加到blueView的layer上
        blueView.layer.add(animation, forKey: nil)
    }
}

