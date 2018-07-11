//
//  ViewController.swift
//  基于NSTimer的逐帧动画
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建imageView
    private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.frame = UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - 私有属性
    
    /// 索引
    private var index = 0
    
    /// Timer
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将imageView添加到当前控制器的view上
        view.addSubview(imageView)
        
        // 通过定时器Timer来加载图片
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.loadImageData), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .lightGray
    }
}

extension ViewController {
    
    @objc func loadImageData() {
        
        // 加载图片
        imageView.image = UIImage(named: "\(index).png")
        index += 1
        
        // 判断图片是否为最后一张
        if(index == 80){
            
            // 如果是最后一张图片，那么就停止Timer
            timer?.invalidate()
            
            // 让图片定格在最后一张图片上
            imageView.image = UIImage(named: "\(index).png")
        }
    }
}
