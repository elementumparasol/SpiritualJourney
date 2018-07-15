//
//  ViewController.swift
//  梯度渐变效果
//
//  Created by Enrica on 2018/7/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// blueView
    private lazy var blueView: UIView = {
        
        let blueView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        blueView.backgroundColor = .blue
        
        insertGradientLayer(blueView)
        
        return blueView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.center = view.center
        view.addSubview(blueView)
    }

    
    /// 实现颜色的梯度渐变
    ///
    /// - Parameter view: 需要在哪个控件上实现梯度渐变
    func insertGradientLayer(_ view: UIView) {
        
        // 创建CAGradientLayer实例
        let gradientLayer = CAGradientLayer()

        // 设置梯度起始位置
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        // gradientLayer.locations = [0.0, 0.5, 1.0]
    
        // 设置梯度颜色
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.brown.cgColor, UIColor.magenta.cgColor]
    
        // 设置梯度范围
        gradientLayer.frame = view.frame
        
        // 将gradientLayer插入到当前view上
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

