//
//  ViewController.swift
//  常用动画属性
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建orangeView
    fileprivate lazy var orangeView: UIView = {
        
        let orangeView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        orangeView.backgroundColor = .orange
        return orangeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改orangeView的中心点坐标
        orangeView.center = view.center
        
        // 将orangeView添加到当前控制器的view上
        view.addSubview(orangeView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 是否开启动画
        UIView.setAnimationsEnabled(true)
        
        // 设置动画执行的周期
        UIView.setAnimationDuration(2)
        
        // 设置动画执行是否延迟
        UIView.setAnimationDelay(1)  // 动画启动之后，延迟1秒执行
        
        // 设置动画执行的次数
        UIView.setAnimationRepeatCount(5)  // 重复5次，如果设置MAXFLOAT，则表示重复n次
        
        // 设置动画加速、加速的效果
        // - easeIn: 动画开始时呈现减速效果
        // - easeInOut: 动画开始和结束时呈现减速效果
        // - easeOut: 动画结束时呈现减速效果
        // - linear: 线性的执行动画(匀速)
        UIView.setAnimationCurve(UIView.AnimationCurve.easeInOut)
        
        // 如果设置为true,代表动画每次重复执行的效果会跟上一次相反
        UIView.setAnimationRepeatAutoreverses(true)
        
        // 设置旋转角度
        let rotationAngle = CGFloat(Double.pi / 4)
        
        // 给orangeView设置动画
        orangeView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        // 设置圆角
        orangeView.layer.masksToBounds = true
        
        // 设置圆角半径
        orangeView.layer.cornerRadius = orangeView.bounds.size.width * 0.25
        
        // 提交动画
        UIView.commitAnimations()
    }
}

