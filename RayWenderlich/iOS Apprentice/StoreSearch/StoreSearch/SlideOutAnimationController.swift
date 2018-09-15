//
//  SlideOutAnimationController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


class SlideOutAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    // 设置转场动画总的执行时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    // 设置转场动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 从转场动画中获取fromView，并且对其进行校验
        if let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
            
            // 获取fromView的父控件(通过transitionContext的containerView获取)
            let containerView = transitionContext.containerView
            
            // 设置转场动画的执行时长(上面已经设置了，直接获取就可以了)
            let time = transitionDuration(using: transitionContext)
            
            // 添加UIView动画
            UIView.animate(withDuration: time, animations: {
                
                // 重设fromView中心点x的坐标
                fromView.center.x -= containerView.bounds.size.height
                
                // 设置fromView基于bounds的中心点位置的视图变换
                fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }) { (finished) in
                
                // 告诉系统，转场动画执行完成
                transitionContext.completeTransition(finished)
            }
        }
    }
}
