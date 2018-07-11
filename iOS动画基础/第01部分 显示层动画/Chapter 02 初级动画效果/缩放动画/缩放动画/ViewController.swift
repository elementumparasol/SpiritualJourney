//
//  ViewController.swift
//  缩放动画
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建blueView
    fileprivate lazy var blueView: UIView = {
        
        let blueView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        blueView.backgroundColor = .blue
        return blueView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改blueView中心点的位置
        blueView.center = view.center
        
        // 将BlueView添加到当前控制器的view上
        view.addSubview(blueView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置动画执行周期
        UIView.setAnimationDuration(2)
        
        // 设置动画属性
        blueView.transform = CGAffineTransform(scaleX: 0.5, y: 1.5)
        
        // 提交动画
        UIView.commitAnimations()
    }
}

