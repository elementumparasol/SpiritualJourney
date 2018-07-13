//
//  ViewController.swift
//  淡入淡出
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// redView
    private lazy var redView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.center = view.center
        view.addSubview(redView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = UIColor.green.cgColor
        animation.duration = 5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        redView.layer.add(animation, forKey: nil)
    }
}

