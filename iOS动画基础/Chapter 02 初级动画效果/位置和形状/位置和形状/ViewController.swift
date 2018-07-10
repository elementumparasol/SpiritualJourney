//
//  ViewController.swift
//  位置和形状
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// 创建purpleView
    fileprivate lazy var purpleView: UIView = {
        
        let purpleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        purpleView.backgroundColor = .purple
        return purpleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改purpleView的中心点x的位置
        purpleView.center.x = view.center.x
        
        // 将purpleView添加到当前控制器的view上面
        view.addSubview(purpleView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置动画周期
        UIView.setAnimationDuration(1.5)
        
        // 设置动画属性
        purpleView.center = view.center
        purpleView.bounds = CGRect(origin: .zero, size: CGSize(width: purpleView.frame.size.width * 1.5, height: purpleView.frame.size.height * 0.6))
        
        // 提交动画
        UIView.commitAnimations()
    }
}

