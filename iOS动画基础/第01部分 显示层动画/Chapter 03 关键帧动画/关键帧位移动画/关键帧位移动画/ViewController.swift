//
//  ViewController.swift
//  关键帧位移动画
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
        imageView.image = UIImage(named: "jumao.jpeg")
        imageView.sizeToFit()
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置imageView的中线点x的坐标
        imageView.center.x = view.center.x
        
        // 将imageView添加到当前控制器的view上
        view.addSubview(imageView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animateKeyframes(withDuration: 2, delay: 1, options: UIView.KeyframeAnimationOptions.calculationModeCubic, animations: {
            self.imageView.frame.origin.y = UIScreen.main.bounds.size.height - self.imageView.bounds.size.height
        }) { (finished) in
            
            // 动画完成之后，再让imageView回到控制器view的中心点
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(1)
            self.imageView.center = self.view.center
            UIView.commitAnimations()
        }
    }
}

