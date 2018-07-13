//
//  ViewController.swift
//  颜色渐变
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// brownView
    private lazy var brownView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .brown
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        brownView.center = view.center
        view.addSubview(brownView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.fromValue = UIColor.brown.cgColor
        animation.toValue = UIColor.magenta.cgColor
        animation.duration = 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        brownView.layer.add(animation, forKey: nil)
    }
}

