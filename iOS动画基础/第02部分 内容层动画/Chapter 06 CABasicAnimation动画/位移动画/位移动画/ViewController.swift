//
//  ViewController.swift
//  位移动画
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建purpleView
    private lazy var purpleView: UIView = {
        
        let purpleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        purpleView.backgroundColor = .purple
        return purpleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置purpleView的位置
        purpleView.center.x = view.center.x
        
        view.addSubview(purpleView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.translation.y"
        animation.toValue = view.frame.size.height - purpleView.frame.size.height
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        purpleView.layer.add(animation, forKey: nil)
    }
}

