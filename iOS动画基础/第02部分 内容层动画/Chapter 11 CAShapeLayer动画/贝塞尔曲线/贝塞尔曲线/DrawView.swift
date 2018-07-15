//
//  DrawView.swift
//  贝塞尔曲线
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        // 绘制直线
        drawStraightLine()
    }

    /// 使用贝塞尔曲线绘制直线
    func drawStraightLine() {
        
        // 创建贝塞尔实例对象
        let bezierPath = UIBezierPath()
        
        // 设置曲线的宽度
        bezierPath.lineWidth = 5
        
        // 确定曲线起点
        bezierPath.move(to: CGPoint(x: 50, y: 50))
        
        // 确定下一个点(两点之间的连线就是一条直线)
        bezierPath.addLine(to: CGPoint(x: center.x, y: 100))
        
        // 再确定下一个点
        bezierPath.addLine(to: CGPoint(x: bounds.size.width - 50, y: 50))
        
        // 连接到起点
        //bezierPath.addLine(to: CGPoint(x: 50, y: 50))
        bezierPath.close()  // 关闭回路
        
        // 设置曲线颜色
        UIColor.magenta.set()
        
        // 渲染到图形上下文
        bezierPath.stroke()
        
        
    }

}
