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
        
        // 绘制曲线
        drawQuadCurveLine()
        
        // 绘制矩形图
        drawRectangle()
        
        // 绘制圆角矩形
        drawRoundRect()
    }

    /// 使用贝塞尔曲线绘制直线
    func drawStraightLine() {
        
        // 创建贝塞尔实例对象
        let bezierPath = UIBezierPath()
        
        // 设置曲线的宽度
        bezierPath.lineWidth = 10
        
        // 绘制线条末端为圆角演示
        bezierPath.lineCapStyle = .round
        
        // 设置两条线断交汇处(拐角)为圆角
        bezierPath.lineJoinStyle = .round
        
        // 确定曲线起点
        bezierPath.move(to: CGPoint(x: 150, y: 20))
        
        // 确定下一个点(两点之间的连线就是一条直线)
        bezierPath.addLine(to: CGPoint(x: 50, y: 100))
        
        // 再确定下一个点
        bezierPath.addLine(to: CGPoint(x: bounds.size.width - 50, y: 30))
        
        // 连接到起点
        //bezierPath.addLine(to: CGPoint(x: 50, y: 50))
        bezierPath.close()  // 关闭回路
        
        // 设置线条需要渲染的颜色
        UIColor.magenta.setStroke()
        
        // 设置内部需要渲染的颜色
        UIColor.green.setFill()
        
        // 内部颜色渲染
        bezierPath.fill()
        
        // 线段颜色渲染(注意，外部线条渲染一定要放在内部渲染的后面，否则会出现意想不到的结果)
        bezierPath.stroke()
    }
    
    
    /// 绘制曲线
    func drawQuadCurveLine() {
        
        let bezierPath = UIBezierPath()
        
        // 设置起点
        bezierPath.move(to: CGPoint(x: 50, y: 125))
        
        // 添加一根曲线到某一个点
        bezierPath.addQuadCurve(to: CGPoint(x: bounds.size.width - 20, y: 105), controlPoint: CGPoint(x: 105, y: 200))
        
        // 设置线条的宽度
        bezierPath.lineWidth = 5
        
        // 设置线条末端的样式
        bezierPath.lineCapStyle = .butt
        
        // 设置线条的颜色
        UIColor.brown.setStroke()
        
        // 渲染线条
        bezierPath.stroke()
    }
    
    /// 绘制矩形
    func drawRectangle() {
        
        // 创建UIBezierPath对象，并且描述矩形路径
        let bezierPath = UIBezierPath(rect: CGRect(x: 50, y: 175, width: 235, height: 70))
        
        // 设置线条的宽度
        bezierPath.lineWidth = 5
        
        // 设置线条连接处的样式
        bezierPath.lineJoinStyle = .round
        
        // 设置线条的颜色
        UIColor.purple.setStroke()
        
        // 渲染线条
        bezierPath.stroke()
    }
    
    /// 绘制圆角矩形
    func drawRoundRect() {
        
        // 创建UIBezierPath对象，并且描述路径和圆角半径
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: 50, y: 255, width: 235, height: 70), cornerRadius: 20)
        bezierPath.lineWidth = 5
        bezierPath.lineJoinStyle = .round
        UIColor.blue.setStroke()
        bezierPath.stroke()
    }
}
