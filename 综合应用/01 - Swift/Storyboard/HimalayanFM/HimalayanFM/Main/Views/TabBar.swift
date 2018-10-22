//
//  TabBar.swift
//  HimalayanFM
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class TabBar: UITabBar {
    
    // MARK: - 类自带的方法

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 统一设置UI界面
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 存储按钮
        var buttonArray = [Any]()
        
        // 遍历tabBar的子控件
        for subview in subviews {
            
            // 找到UITabBarButton类型的子控件
            if subview.isKind(of: NSClassFromString("UITabBarButton")!) {
                
                // 将UITabBarButton类型的子控件存储到数组buttonArray中
                buttonArray.append(subview)
            }
        }
        
        // 计算tabBarButton的宽度
        let buttonWidth = (kScreenWidth - 58) / CGFloat(buttonArray.count)
        
        
        for (index, subview) in buttonArray.enumerated() {
            
            // 获取subview的frame
            var subviewFrame = (subview as! UIView).frame
            
            // 调整tabBarButton的x值
            if index >= buttonArray.count / 2 {
                
                // 设置下标值为2和3这两个button的x值
                subviewFrame.origin.x = CGFloat(index) * buttonWidth + 58
            } else {
                
                // 设置下标值为0和1这两个button的x值
                subviewFrame.origin.x = CGFloat(index) * buttonWidth
            }
            
            // 设置tabBarButton的宽度
            subviewFrame.size.width = buttonWidth
            
            // 重新设置subviewFrame的frame
            (subview as! UIView).frame = subviewFrame
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        //
    }
    
    
    
    
}
