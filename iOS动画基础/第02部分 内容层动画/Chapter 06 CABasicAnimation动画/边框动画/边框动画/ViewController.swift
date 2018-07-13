//
//  ViewController.swift
//  边框动画
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建greenView
    private lazy var greenview: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenview.center = view.center
        view.addSubview(greenview)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "borderWidth"
        
        // 设置边框的宽度
        animation.toValue = greenview.frame.size.width * 0.15
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        // 设置边框的背景颜色
        greenview.layer.borderColor = UIColor.cyan.cgColor
        greenview.layer.add(animation, forKey: nil)
    }
}

