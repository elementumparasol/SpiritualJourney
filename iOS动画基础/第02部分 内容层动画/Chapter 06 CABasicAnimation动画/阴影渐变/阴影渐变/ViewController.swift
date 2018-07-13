//
//  ViewController.swift
//  阴影渐变
//
//  Created by Enrica on 2018/7/13.
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
        
        blueView.center = view.center
        view.addSubview(blueView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "shadowOffset"
        
        // 设置阴影范围
        animation.toValue = CGSize(width: 20, height: 20)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        // 设置阴影的颜色
        blueView.layer.shadowColor = UIColor.brown.cgColor
        
        // 设置阴影的透明度
        blueView.layer.shadowOpacity = 0.5
        blueView.layer.add(animation, forKey: nil)
    }
}

