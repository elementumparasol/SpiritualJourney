//
//  ViewController.swift
//  旋转动画
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建brownView
    fileprivate lazy var brownView: UIView = {
        
        let brownView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        brownView.backgroundColor = .brown
        return brownView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改brownView的中心点的位置
        brownView.center = view.center
        
        // 将brownView添加到当前控制器的view上
        view.addSubview(brownView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 2) {
            
            // 设置圆角
            self.brownView.layer.masksToBounds = true
            
            // 设置圆角半径
            self.brownView.layer.cornerRadius = self.brownView.bounds.size.width * 0.25
            
            // 设置旋转角度
            let rotationAngle = CGFloat(Double.pi / 4)
            
            // 执行旋转动画
            self.brownView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
}

