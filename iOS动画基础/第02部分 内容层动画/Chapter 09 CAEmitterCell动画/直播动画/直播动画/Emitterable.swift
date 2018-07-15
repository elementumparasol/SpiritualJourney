//
//  Emitterable.swift
//  直播动画
//
//  Created by Enrica on 2018/7/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

protocol Emitterable {
    
    // 协议里面只能有属性或者是函数方法的声明，不能有函数方法的实现
    // Protocol methods must not have bodies
}


extension Emitterable where Self: UIViewController {  // 带where子句的协议扩展
    
    /**
     * 协议的扩展中可以增加带有实现代码的计算属性，或者是方法(协议中是不可以的)
     */
    
    /// 开发发射粒子
    ///
    /// - Parameters:
    ///   - view: 控制器的view
    ///   - emitterPoint: 发射粒子的位置
    ///   - emitterCellCount: emitterCell的种类，如果不传，默认就是只有一种
    func startEmitterLayer(_ view: UIView, _ emitterPoint: CGPoint, _ emitterCellCount: Int = 1) {
        
        // MARK: - 发射器
        
        // 创建发射器
        let emitterLayer = CAEmitterLayer()
        
        // 设置发射器的位置
        emitterLayer.emitterPosition = emitterPoint
        
        // 开启三维效果
        emitterLayer.preservesDepth = true
        
        // MARK: - 粒子
        
        // 用于保存创建的CAEmitterCell实例
        var emitterCellsArray: [CAEmitterCell] = []
        
        // 创建emitterCell
        for idx in 1...emitterCellCount {
            
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
            emitterCell.contents = UIImage(named: "good\(idx)_30x30_")?.cgImage
            
            // 将粒子添加到数组中
            emitterCellsArray.append(emitterCell)
        }
        
        // 将粒子装到发射器中
        emitterLayer.emitterCells = emitterCellsArray
        
        // 将发射器layer添加到父控件的layer上
        view.layer.addSublayer(emitterLayer)
    }
    
    /// 结束粒子动画
    func stopEmitterLayer() {
        
        /*
        // 遍历控制器view的sublayers数组
        for layer in view.layer.sublayers! {
            
            // 取出CAEmitterLayer
            if layer.isKind(of: CAEmitterLayer.self) {
                
                // 将CAEmitterLayer移除
                layer.removeFromSuperlayer()
            }
        }
        */
        
        // 找到CAEmitterLayer，然后再将其从控制器view的layer上面移除
        view.layer.sublayers?.filter({ $0.isKind(of: CAEmitterLayer.self) }).first?.removeFromSuperlayer()
    }
}

