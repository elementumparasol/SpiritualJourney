//
//  ViewController.swift
//  播放GIF图片
//
//  Created by Enrica on 2018/7/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建imageView
    private lazy var imageView: UIImageView = {
        
        // 创建imageView对象
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        
        // 设置imageView的背景颜色
        imageView.backgroundColor = .lightGray
        
        // 设置imageView的内容模式
        imageView.contentMode = .center
        
        // 返回imageView
        return imageView
    }()
    
    /// 用于存放图片数组
    private lazy var images: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将imageView添加到当前控制器的view上
        view.addSubview(imageView)
        
        // 展示GIF图片
        displayGIFImage()
    }

    /// 播放GIF图片
    private func displayGIFImage() {
        
        // 从本地读取PNG图片
        for idx in 0...99 {
            
            // 拼接图片的名称
            let imageName = "\(idx).png"
            
            // 获取PNG图片
            guard let image = UIImage(named: imageName) else { return }
            
            // 将图片添加到数组images中
            images.append(image)
        }
        
        // 设置图片数组用于播放动画
        imageView.animationImages = images
        
        // 设置动画播放时长
        imageView.animationDuration = 5
        
        // 设置动画重复次数
        imageView.animationRepeatCount = 0  // 设置值为0表示无限播放
        
        // 开始播放动画
        imageView.startAnimating()
    }
}

