//
//  SnowView.swift
//  航班信息
//
//  Created by Enrica on 2018/10/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import QuartzCore

class SnowView: UIView {
    
    // (1)、在iOS中，所有的view都是由一个底层的layer来驱动的
    // view和它的layer之间有着紧密的联系，view其实直接从layer
    // 对象中获取了绝大多数它所需要的数据；
    //
    // (2)、在iOS中也有一些单独的layer，比如CAShapeLayer
    // 等，它们不需要附加到view上就可以在屏幕上显示内容；
    //
    // (3)、默认情况下UIView的layer是CALayer类型的,不过可以
    // 通过继承自UIView，然后重写layerClass属性来指定不
    // 同类型的layer。在我们这里，SnowView就是继承自UIView
    // 的，然后我们通过重写layerClass属性来获取CAEmitterLayer
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /** 1、创建粒子动画 */
        
        // 创建粒子发射器。因为我们在上面重写过layerClass属性，
        // 所以，我们可以通过这种方式来创建CAEmitterLayer实例
        let emitter = layer as! CAEmitterLayer
        
        // 设置粒子发射器中心点的位置
        emitter.emitterPosition = CGPoint(x: bounds.size.width / 2.0, y: 0)
        
        // 确定粒子发射器形状的大小
        emitter.emitterSize = bounds.size
        
        // 指定发射器的形状
        emitter.emitterShape = CAEmitterLayerEmitterShape.rectangle
        
        
        /** 2、创建粒子动画的cell */
        
        // 创建cell(创建由粒子发射器发出的粒子)
        let emitterCell = CAEmitterCell()
        
        // 设置图层内容(粒子中的内容)
        emitterCell.contents = UIImage(named: "snowflake1.png")!.cgImage
        
        // 粒子发射器每秒钟发射粒子的数量
        emitterCell.birthRate = 200
        
        // 每一个粒子存活的时间
        emitterCell.lifetime = 3.5
        
        // 粒子的颜色
        emitterCell.color = UIColor.white.cgColor
        
        // 粒子中红、绿、蓝成分的变化量
        emitterCell.redRange = 0.0
        emitterCell.greenRange = 0.0
        emitterCell.blueRange = 0.1
        
        // 粒子的初始速度
        emitterCell.velocity = 10
        
        // 粒子速度可以变化的量
        emitterCell.velocityRange = 350
        
        // 粒子发射的角度范围(用弧度表示)
        emitterCell.emissionRange = CGFloat(Double.pi / 2.0)
        
        // 粒子发射时在纬度方向上的变化范围(横向的范围)
        // 除了这个意外，emissionLongitude表示经度上的范围
        emitterCell.emissionLatitude = CGFloat(-Double.pi)
        
        // x轴和y轴方向上的加速度矢量
        emitterCell.xAcceleration = 0
        emitterCell.yAcceleration = 70
        
        // 指定粒子的缩放因子
        emitterCell.scale = 0.33
        
        // 指定粒子缩放可以变化的量
        emitterCell.scaleRange = 1.25
        
        // 指定粒子缩放的速度
        emitterCell.scaleSpeed = -0.25
        
        // 指定粒子透明度变化的范围
        emitterCell.alphaRange = 0.5
        
        // 指定粒子透明度变化的速度
        emitterCell.alphaSpeed = -0.15
        
        
        /** 3、将设定好的粒子装进发射器 */
        
        // 我们这里只创建了一种粒子，可以根据
        // 实际需要创建多种粒子
        emitter.emitterCells = [emitterCell]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
