//
//  ViewController.swift
//  圆角动画
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建magentaView
    private lazy var magentaView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .magenta
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        magentaView.center = view.center
        view.addSubview(magentaView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "cornerRadius"
        
        // 设置圆角半径
        animation.toValue = magentaView.bounds.size.width * 0.25
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        magentaView.layer.add(animation, forKey: nil)
    }
}

