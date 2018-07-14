//
//  AnimationButton.swift
//  水波动画
//
//  Created by Enrica on 2018/7/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class AnimationButton: UIButton {

    // MARK: - 自定义属性
    
    /// 普通状态下的标题
    private var normalTitle: String
    
    /// 高亮状态下的标题
    private var highlightedTitle: String
    
    /// 普通状态下标题的颜色
    private var normalTitleColor: UIColor
    
    /// 高亮状态下标题颜色
    private var highlightedTitleColor: UIColor
    
    /// 设置水波的颜色
    private var waveColor: UIColor
    
    /// 水波的半径
    private var waveRadius: CGFloat = 0
    
    /// 触摸点的坐标
    private var touchPoint: CGPoint = CGPoint.zero
    
    /// 记录执行的次数
    private var count: Int = 0
    
    /// 定时器
    private var timer: Timer?
    
    /// 创建自定的按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮的frame
    ///   - normalTitle: 按钮普通状态下的标题
    ///   - highlightedTitle: 按钮高亮状态下的标题
    ///   - normalTitleColor: 按钮普通状态下标题的颜色
    ///   - highlightedTitleColor: 按钮高亮状态下标题的颜色
    ///   - waveColor: 按钮水波的颜色
    init(frame: CGRect, normalTitle: String, highlightedTitle: String, normalTitleColor: UIColor, highlightedTitleColor: UIColor, waveColor: UIColor) {
        
        // 初始化自定义属性
        self.normalTitle = normalTitle
        self.highlightedTitle = highlightedTitle
        self.normalTitleColor = normalTitleColor
        self.highlightedTitleColor = highlightedTitleColor
        self.waveColor = waveColor
        
        // 初始化父类的属性
        super.init(frame: frame)
        
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - 设置UI界面
extension AnimationButton {
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 设置按钮的圆角
        layer.masksToBounds = true
        layer.cornerRadius = 5
        
        // 设置按钮的文字
        setTitle(normalTitle, for: .normal)
        setTitle(highlightedTitle, for: .highlighted)
        
        // 设置按钮文字颜色
        setTitleColor(normalTitleColor, for: .normal)
        setTitleColor(highlightedTitleColor, for: .highlighted)
    }
    
    
    /// 执行水波动画
    ///
    /// - Parameters:
    ///   - button: 按钮
    ///   - event: 事件
    func startWaveAnimation(_ button: UIButton, event: UIEvent) {
        
        // 一旦开始执行动画，就禁止按钮的点击
        isUserInteractionEnabled = false
        
        // 获取所有的触摸集合
        let touches = event.touches(for: button)
        
        // 从集合中取出点击事件(因为我们这里按钮只能点击，所以触摸事件只有一个)
        guard let touch = touches?.first else { return }

        // 获取触摸点的坐标系
        touchPoint = touch.location(in: button)
        
        /*********************************************************/
        
        // 添加定时器
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(AnimationButton.scheduledTimer), userInfo: nil, repeats: true)
        
        // 将定时器添加到RunLoop中
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    /// 绘图
    override func draw(_ rect: CGRect) {
        
        // 获取图形上下文
        let ctx = UIGraphicsGetCurrentContext()
        
        // 设置结束角度
        let endAngle = CGFloat(Double.pi * 2)  // 360°
        
        // 绘制带有弧度的图像(clockwise表示顺时针方向)
        ctx?.addArc(center: touchPoint, radius: waveRadius, startAngle: 0, endAngle: endAngle, clockwise: false)
        
        // 渲染水波的颜色
        let waveColor = self.waveColor
        waveColor.setStroke()  // 填充内部颜色
        waveColor.setFill()  // 填充边缘颜色
        
        // 完成图形的绘制
        ctx?.fillPath()
    }
}


// MARK: - 事件监听
extension AnimationButton {
    
    /// 定时器任务
    @objc func scheduledTimer() {
        
        // 调用次数加1
        count += 1
        
        // 创建dispatchTime
        let dispatchTime = DispatchTime.now() + Double(Int64(0*NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
        
        // GCD的延时函数
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            
            // 增加水波的半径
            self.waveRadius += 5
            
            // 重新绘图
            self.setNeedsDisplay()
        }
        
        // 如果调用超过60次
        if count > 60 {
            
            // 调用次数和水波半径清零
            count = 0
            waveRadius = 0
            
            // 移除定时器
            timer?.invalidate()
            
            // GCD延时函数
            DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                
                // 半径清零
                self.waveRadius = 0
                self.setNeedsDisplay()
            }
            
            // 动画执行完成，让按钮可以交互
            isUserInteractionEnabled = true
        }
    }
}
