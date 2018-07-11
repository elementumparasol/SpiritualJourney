//
//  ViewController.swift
//  位移动画
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建cyanView
    fileprivate lazy var cyanView: UIView = {
        
        let cyanView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        cyanView.backgroundColor = .cyan
        return cyanView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改cyanView中心点x的坐标
        cyanView.center.x = view.center.x
        
        // 将cyanView添加到当前控制器的view上
        view.addSubview(cyanView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置动画执行周期
        UIView.setAnimationDuration(2)
        
        // 设置动画属性
        cyanView.transform = CGAffineTransform(translationX: 0, y: view.center.y - cyanView.bounds.size.height * 0.5)
        
        // 提交动画
        UIView.commitAnimations()
    }
}

