//
//  ViewController.swift
//  梯度渐变动画
//
//  Created by Enrica on 2018/7/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// blueView
    private lazy var blueView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .blue
        
        // 实现梯度动画
        insertGradientLayer(view)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.center = view.center
        view.addSubview(blueView)
    }

    
    /// 在指定的控件上插入渐变动画
    ///
    /// - Parameter view: 需要插入渐变动画的控件
    func insertGradientLayer(_ view: UIView) {
        
        // 创建CAGradientLayer实例
        let gradientLayer = CAGradientLayer()
        
        // 设置gradientLayer的frame
        gradientLayer.frame = view.frame
        
        // 设置渐变位置
        gradientLayer.locations = [0.0, 1.0]
        
        // 设置渐变颜色
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.magenta.cgColor]
        
        // 创建渐变动画
        let animation = CABasicAnimation()
        animation.keyPath = "locations"
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 3
        animation.repeatCount = MAXFLOAT
        
        // 将渐变动画添加到gradientLayer上面
        gradientLayer.add(animation, forKey: nil)
        
        // 将gradientLayer插入到指定的控件上
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

