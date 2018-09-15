//
//  FadeOutAnimationController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


class FadeOutAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    // 设置动画执行的总时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    // 设置动画执行的效果
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 通过指定的键，从转场动画中获取fromView
        if let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
            
            // 获取动画执行的总时长
            let time = transitionDuration(using: transitionContext)
            
            // 添加UIView动画
            UIView.animate(withDuration: time, animations: {
                
                // 设置fromView的alpha值
                fromView.alpha = 0
            }) { (finished) in
                
                // 告诉系统，转场动画执行完毕
                transitionContext.completeTransition(finished)
            }
        }
    
    }
    
    
    
}
