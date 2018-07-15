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
        
        // 自定义按钮
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 150, height: 44)))
        
        // 设置按钮普通状态下的文字
        button.setTitle("点击发射", for: .normal)
        
        // 设置按钮高亮状态下的文字
        button.setTitle("发射中...", for: .highlighted)
        
        // 设置按钮的圆角
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        
        // 设置按钮的背景颜色
        button.backgroundColor = .red
        
        // 监听按钮的点击
        button.addTarget(self, action: #selector(ViewController.emitButtonClick(_:)), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置按钮的y值
        emitButton.frame.origin.y = view.bounds.size.height - emitButton.bounds.size.height - 20
        
        // 设置按钮中心点x的坐标
        emitButton.center.x = view.center.x
        
        // 键按钮添加到当前控制器的view中
        view.addSubview(emitButton)
    }
}

// MARK: - Emitterable协议
extension ViewController: Emitterable {
    
    /// 监听屏幕上按钮的点击
    @objc func emitButtonClick(_ button: UIButton) {
        
        // 将按钮的选中状态取反
        button.isSelected = !button.isSelected
        
        // 根据按钮当前的选中状态来决定是否发射粒子
        button.isSelected ? startEmitterLayer(view, emitButton.center, 9): stopEmitterLayer()
    }
}
