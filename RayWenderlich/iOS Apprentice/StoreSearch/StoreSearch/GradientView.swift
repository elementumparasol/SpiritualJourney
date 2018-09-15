//
//  GradientView.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


class GradientView: UIView {
    
    // MARK: - 类自带的方法
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 设置透明的背景颜色
        backgroundColor = .clear
        
        // 宽度和高度随父控件的变化而进行相应的伸缩
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // 设置透明的背景颜色
        backgroundColor = .clear
        
        // 宽度和高度随父控件的变化而进行相应的伸缩
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // 绘制梯度渐变的背景。一般来说，因为draw(_:)方法有可能会
    // 被反复调用多次，因此在这里面创建实例对象并不是一个非常好
    // 的选择。比较好的做法是，使用懒加载来创建实例对象，然后在
    // draw(_:)方法中调用
    override func draw(_ rect: CGRect) {
    
        // (0, 0, 0, 0.3)表示黑色，透明度为0.3，它位于渐变中的位置0
        // (0, 0, 0, 0.7)表示黑色，透明度为0.7，它位于渐变中的位置1
        // 在UIKit和Core Graphics中，颜色和不透明度的值的范围是(0, 1)
        // 数组locations中的0和1分别表示0%和100%。如果在数组中设置两种
        // 以上的颜色，那么就需要指定放置这些颜色的渐变中的位置百分比
        let components: [CGFloat] = [0, 0, 0, 0.3, 0, 0, 0, 0.7]
        let locations: [CGFloat] = [0, 1]
        
        // 创建基于设备的RGB颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 使用指定的colorComponents和locations，从颜色空间中创建CGGradient对象
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: 2)
        
        // 拥有了gradient实例对象之后，还需要指定要绘制多大的面积
        let x = bounds.midX  // 中心点x的坐标
        let y = bounds.midY  // 中心点y的坐标
        let centerPoint = CGPoint(x: x, y: y)  // 中心点的坐标
        let radius = max(x, y)  // 计算半径
        
        // 因为核心绘图始终是在图形上下文中进行的，所以在开始绘图
        // 之前，需要先获取图形上下文，然后才能真正的开始后面的工
        // 作。而drawRadialGradient(_ : ,startCenter: ,
        // startRadius: ,endCenter: ,endRadius: ,options: )
        // 方法的作用就是，根据指定的参数来绘制梯度渐变图形
        let context = UIGraphicsGetCurrentContext()
        context?.drawRadialGradient(gradient!, startCenter: centerPoint, startRadius: 0, endCenter: centerPoint, endRadius: radius, options: .drawsAfterEndLocation)
        
    }
}
