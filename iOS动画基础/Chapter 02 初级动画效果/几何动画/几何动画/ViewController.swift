//
//  ViewController.swift
//  几何动画
//
//  Created by Enrica on 2018/7/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// 创建magentaView
    fileprivate lazy var magentaView: UIView = {
        
        let magentaView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 180, height: 180)))
        
        magentaView.backgroundColor = .magenta
        
        return magentaView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置redView的center
        magentaView.center = view.center
        
        // 将redView添加到当前控制器的view上
        view.addSubview(magentaView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1.5) {
            self.magentaView.bounds = CGRect(origin: .zero, size: CGSize(width: self.magentaView.frame.size.width * 1.5, height: self.magentaView.frame.size.height * 0.5))
        }
    }

}

