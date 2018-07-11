//
//  ViewController.swift
//  基于CADisplayLink的逐帧动画
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 创建imageView
    private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - 私有属性
    
    /// 索引
    private var index = 0
    
    /// displayLink
    private var displayLink: CADisplayLink?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将imageView添加到当前控制器的view上
        view.addSubview(imageView)
        
        // 创建displayLink
        displayLink = CADisplayLink.init(target: self, selector: #selector(ViewController.loadImageData))
        
        // 标识每秒钟调用几次
        displayLink?.preferredFramesPerSecond = 80
        
        // 在RunLoop中注册。在使用CADisplayLink时，需要向RunLoop进行注册。每当屏幕需要刷新的时候就
        // 会调用绑定的target和selector，这时target可以读到CADisplayLink 的每次调用的时间戳，用来
        // 准备下一帧需要展示的数据。在做UI更新的时候，需要通过时间戳来计算UI对象在动画的下一帧要更新的大小
        displayLink?.add(to: .current, forMode: .default)
    }


}

extension ViewController {
    
    /// 加载图片数据
    @objc func loadImageData() {
        
        // 加载图片
        imageView.image = UIImage(named: "\(index).png")
        
        index += 1
        
        // 判断图片是否为最后一张
        if(index == 80){
            
            // 动画播放完毕，需要从RunLoop中移除displayLink
            displayLink?.remove(from: .current, forMode: .default)
            
            // 让图片定格在最后一张图片上
            imageView.image = UIImage(named: "\(index).png")
        }
    }
}
