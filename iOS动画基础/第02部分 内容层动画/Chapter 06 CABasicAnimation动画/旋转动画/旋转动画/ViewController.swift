//
//  ViewController.swift
//  旋转动画
//
//  Created by Enrica on 2018/7/13.
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
        
        // 修改blueView的位置
        blueView.center = view.center
        
        // 将blueView添加到当前控制器的view上
        view.addSubview(blueView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        
        // 设置animation的keyPath
        animation.keyPath = "transform.rotation"
        
        animation.byValue = Double.pi * 0.25
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        blueView.layer.add(animation, forKey: nil)
    }
}

