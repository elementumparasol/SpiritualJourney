//
//  ViewController.swift
//  常用动画回调方法
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建blueView
    fileprivate lazy var blueView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改blueView中心点的坐标
        blueView.center = view.center
        
        // 将blueView添加到当前控制器的view上
        view.addSubview(blueView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 开始动画
        UIView.beginAnimations(nil, context: nil)
        
        // 设置回调对象
        UIView.setAnimationDelegate(self)
        
        // 动画完成之后回调
        UIView.setAnimationDidStop(#selector(ViewController.animationEnd))
        
        // 设置动画执行周期
        UIView.setAnimationDuration(2)
        
        // 设置blueView旋转的角度
        let rotationAngle = CGFloat(Double.pi * 0.25)
        
        // 设置blueView按照特定的角度进行旋转
        blueView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        // 提交动画
        UIView.commitAnimations()
    }
}


extension ViewController {
    
    /// 动画结束之后需要完成的事情
    @objc func animationEnd() {
        
        UIView.animate(withDuration: 2) {
            self.blueView.backgroundColor = .green
            self.blueView.layer.masksToBounds = true
            self.blueView.layer.cornerRadius = self.blueView.bounds.size.width * 0.25
        }
    }
}
