//
//  ViewController.swift
//  组合动画
//
//  Created by Enrica on 2018/7/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// blueView
    private lazy var blueView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改blueView的位置
        blueView.center.x = view.center.x
        
        // 将blueView添加到当前控制器的view上
        view.addSubview(blueView)
        
        // 执行动画
        displayAnimation()
    }

    /// 播放动画组
    private func displayAnimation() {
        
        // 创建旋转动画
        let rotationAnimation = CABasicAnimation()
        rotationAnimation.keyPath = "transform.rotation"
        let rotationAngle = Double.pi * 0.25
        rotationAnimation.toValue = rotationAngle
        
        // 创建缩放动画
        let scaleAnimation = CABasicAnimation()
        scaleAnimation.keyPath = "transform.scale"  // 表示x和y都缩放，transform.scale.x表示缩放x轴，transform.scale.y表示缩放y轴
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 0.5
        
        // 创建平移动画
        let translationAnimation = CABasicAnimation()
        translationAnimation.keyPath = "transform.translation.y"  // 沿着y轴方向做平移运动
        translationAnimation.toValue = view.frame.size.height - blueView.frame.size.height
        
        // 创建颜色渐变动画
        let colorAnimation = CABasicAnimation()
        colorAnimation.keyPath = "backgroundColor"
        colorAnimation.toValue = UIColor.magenta.cgColor
        
        // 创建圆角动画
        let cornerRadiusAnimation = CABasicAnimation()
        cornerRadiusAnimation.keyPath = "cornerRadius"
        cornerRadiusAnimation.toValue = blueView.bounds.size.width * 0.25
        
        // 创建动画组
        let animationGroup = CAAnimationGroup()
        
        // 设置动画组的animations
        animationGroup.animations = [rotationAnimation, translationAnimation, scaleAnimation, colorAnimation, cornerRadiusAnimation]
        
        // 设置动画组的执行时长
        animationGroup.duration = 3
        
        // 设置动画组完成之后的状态
        animationGroup.fillMode = .forwards
        
        // 设置动画组执行完成之后是否需要从layer上移除
        animationGroup.isRemovedOnCompletion = false
        
        // 将动画组添加到blueView的layer上
        blueView.layer.add(animationGroup, forKey: nil)
    }
}

