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
    
    /// 点击区域的x坐标
    private var centerX: Float = 0
    
    /// 点击区域的y坐标
    private var centerY: Float = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 统一设置UI界面
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
        
        // 设置按钮的背景颜色
        backgroundColor = .red
        
        // 设置按钮的圆角
        layer.masksToBounds = true
        layer.cornerRadius = 5
        
        // 设置按钮的文字
        setTitle("登录", for: .normal)
        setTitle("登录中...", for: .highlighted)
        
        // 设置按钮文字颜色
        setTitleColor(.lightGray, for: .highlighted)
    }
}
