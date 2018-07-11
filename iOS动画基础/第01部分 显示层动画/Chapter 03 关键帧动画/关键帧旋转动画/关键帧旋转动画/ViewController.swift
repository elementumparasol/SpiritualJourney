//
//  ViewController.swift
//  关键帧旋转动画
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建imageView
    fileprivate lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Life and me.jpg")
        imageView.sizeToFit()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置imageView的位置
        imageView.center = view.center
        
        // 将imageView添加到当前控制器的view中
        view.addSubview(imageView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 执行动画
        UIView.animateKeyframes(withDuration: 5, delay: 1, options: UIView.KeyframeAnimationOptions.calculationModeLinear, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                
                let rotationAngle = CGFloat(Double.pi * 0.25)
                self.imageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
            })
            
        }) { (finished) in
            
            UIView.animate(withDuration: 2, animations: {
                self.imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            })
        }
    }
}

