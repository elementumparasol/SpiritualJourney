//
//  ScrollView.swift
//  CustomScrollView
//
//  Created by Enrica on 2018/6/17.
//  Copyright © 2018年 Enrica. All rights reserved.
//

import UIKit

class ScrollView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // 创建pan手势
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panView(with:)))
        
        // 添加pan手势
        addGestureRecognizer(panGesture)
    }
    
    
    /// 手势执行的方法
    ///
    /// - Parameter gestureRecognizer: 传入手势
    @objc func panView(with gestureRecognizer: UIPanGestureRecognizer) {
        
        // 获取手势所在的坐标系
        let translation = gestureRecognizer.translation(in: self)
        
        // 添加动画
        UIView.animate(withDuration: 0.2) {
            
            // 更改坐标
            self.bounds.origin.y = self.bounds.origin.y - translation.y
        }
        
        // 重新设置手势的坐标
        gestureRecognizer.setTranslation(CGPoint.zero, in: self)
    }

}
