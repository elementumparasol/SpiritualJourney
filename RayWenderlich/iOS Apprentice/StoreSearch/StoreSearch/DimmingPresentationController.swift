//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


class DimmingPresentationController: UIPresentationController {
    
    // MARK: - 自定义属性
    
    ///
    lazy var dimmingView = GradientView(frame: .zero)
    
    
    // MARK: - 类自带的属性
    
    // 标识presentation转场动画完成之后，是否应该删除
    // presentation控制器的view
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    
    // MARK: - 类自带的方法
    
    // presentation控制器即将开始动画的时候调用
    override func presentationTransitionWillBegin() {
        
        // 设置dimmingView的frame
        dimmingView.frame = containerView!.bounds
        
        // 将dimmingView作为containerView的子控件插入到索引为0的位置
        containerView!.insertSubview(dimmingView, at: 0)
    }
}
