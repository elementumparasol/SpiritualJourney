//
//  ViewController.swift
//  颜色渐变动画
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建colorView
    fileprivate lazy var colorView: UIView = {
        
        let colorView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 180, height: 180)))
        colorView.backgroundColor = .green
        return colorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置colorView中心点的位置
        colorView.center = view.center
        
        // 将colorView添加到当前控制器的view上
        view.addSubview(colorView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 执行动画
        UIView.animate(withDuration: 2) {
            self.colorView.backgroundColor = .magenta
        }
    }

}

