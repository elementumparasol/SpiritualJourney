//
//  AnimationButtom.swift
//  水波动画
//
//  Created by Enrica on 2018/7/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class AnimationButtom: UIButton {

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
    
    /// 点击区域的x坐标
    private var centerX: Float = 0
    
    /// 点击区域的y坐标
    private var centerY: Float = 0
    
    
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
extension AnimationButtom {
    
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
}
