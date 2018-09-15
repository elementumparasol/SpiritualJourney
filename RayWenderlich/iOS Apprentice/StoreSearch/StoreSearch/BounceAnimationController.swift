//
//  BounceAnimationController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/15.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


class BounceAnimationController:NSObject,  UIViewControllerAnimatedTransitioning {
    
    // transitionDuration(using: )这个方法决定了动画执行的长度
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    // animateTransition(using: )动画实际执行的代码步骤
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 创建toViewController和toView，并且对它们进行校验
        // - viewController(forKey: ): 根据指定的键，返回转场中指定的控制器
        // - view(forKey: ): 根据指定的键，返回转场中指定的视图view
        if let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
            
            // 获取转场中视图view的父控件
            let containerView = transitionContext.containerView
            
            // 设置toView的frame(也就是toViewController最终的frame)
            toView.frame = transitionContext.finalFrame(for: toViewController)
            
            // 将toView添加到它的父控件containerView上面
            containerView.addSubview(toView)
            
            // 设置toView的transform属性(指定toView相对于其bounds中心位置的视图变换)
            toView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)  // 70%
            
            // 设置关键帧动画。关键帧动画的好处是，可以让我们分阶段的来执行动画
            // 动画执行的总时长通过调用transitionDuration(using: )获得，
            // 其实也就是最上面设置的0.4
            UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .calculationModeCubic, animations: {
                
                // 动画执行总时长的1/3
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.334, animations: {
                    
                    // 缩放120%(在原始的基础上放大20%)
                    toView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                })
                
                // 动画执行总时长的1/3
                UIView.addKeyframe(withRelativeStartTime: 0.334, relativeDuration: 0.333, animations: {
                    
                    // 缩放90%(在原始的基础上缩小10%)
                    toView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                })
                
                // 动画执行总时长的1/3
                UIView.addKeyframe(withRelativeStartTime: 0.666, relativeDuration: 0.333, animations: {
                    
                    // 缩放100%(也就是恢复到初始状态)
                    toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
                
            }, completion: { finished in
                
                // completeTransition(_ : )通知系统，转场动画已经完成
                transitionContext.completeTransition(finished)
            })
        }
    }
    
    
    
    
}
