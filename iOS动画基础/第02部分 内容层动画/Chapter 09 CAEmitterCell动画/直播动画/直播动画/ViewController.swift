//
//  ViewController.swift
//  直播动画
//
//  Created by Enrica on 2018/7/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// 发射按钮
    private lazy var emitButton: UIButton = {
        
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 150, height: 44)))
        button.setTitle("点击发射", for: .normal)
        button.setTitle("发射中...", for: .highlighted)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(ViewController.emitButtonClick), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emitButton.frame.origin.y = view.bounds.size.height - emitButton.bounds.size.height - 20
        emitButton.center.x = view.center.x
        view.addSubview(emitButton)
    }
}

// MARK: - 监听按钮的点击
extension ViewController {
    
    /// 点击屏幕上的发射按钮，发射粒子
    @objc func emitButtonClick() {
        
        // MARK: - 发射器
        
        // 创建发射器
        let emitterLayer = CAEmitterLayer()
        
        // 设置发射器的位置
        emitterLayer.emitterPosition = emitButton.center
        
        // 开启三维效果
        emitterLayer.preservesDepth = true
        
        // MARK: - 粒子
        
        // 创建粒子
        let emitterCell = CAEmitterCell()
        
        // 设置发射粒子的速度
        emitterCell.velocity = 150
        
        // 设置发射粒子速度的范围(可以理解为误差范围)
        emitterCell.velocityRange = 100  // [50, 250]
        
        // 设置粒子的大小
        emitterCell.scale = 0.7
        emitterCell.scaleRange = 0.3
        
        // 设置粒子发射的方向
        emitterCell.emissionLongitude = CGFloat(-Double.pi * 0.5)  // 负数在坐标系中表示向上发射
        emitterCell.emissionRange = CGFloat(Double.pi * 0.15)
        
        // 设置粒子的旋转角度
        emitterCell.spin = CGFloat(Double.pi * 0.25)
        emitterCell.spinRange = CGFloat(Double.pi * 0.15)
        
        // 设置粒子每秒弹出的个数
        emitterCell.birthRate = 10  // 每秒弹出10个
        
        // 设置粒子的存活时间
        emitterCell.lifetime = 3
        emitterCell.lifetimeRange = 1.5
        
        // 设置粒子展示的图片
        emitterCell.contents = UIImage(named: "good3_30x30_")?.cgImage
        
        // 将粒子装到发射器中
        emitterLayer.emitterCells = [emitterCell]
        
        // 将发射器layer添加到父控件的layer上
        view.layer.addSublayer(emitterLayer)
    }
}
