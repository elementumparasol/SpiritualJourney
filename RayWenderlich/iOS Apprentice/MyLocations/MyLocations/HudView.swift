//
//  HudView.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class HudView: UIView {
    
    var text = ""
    
    /// 创建hudView
    class func hud(inView view: UIView, animated: Bool) -> HudView {
        
        // 创建hudView
        let hudView = HudView(frame: view.bounds)
        
        // 设置hudView是否不透明(设置false表示透明)
        hudView.isOpaque = false  // 如果设置为true，则会出现一块黑色的view
        
        // 将hudView添加到当前view上面
        view.addSubview(hudView)
        
        // 设置view不可交互
        view.isUserInteractionEnabled = false
        
        // 调用show(animated: )方法执行动画
        hudView.show(animated: animated)
        
        return hudView
    }
    
    
    /// draw()方法在控件重绘的时候被调用
    override func draw(_ rect: CGRect) {
        
        /**
         绘制HUD的大小和形状
         */
        
        // 设置HUD的宽度
        let boxWidth: CGFloat = 96
        
        // 设置HUD的高度
        let boxHeight: CGFloat = 96
        
        // 设置HUD的Rect(x, y, width, height)
        let boxRect = CGRect(x: round((bounds.size.width - boxWidth) / 2), y: round((bounds.size.height - boxHeight) / 2), width: boxWidth, height: boxHeight)
        
        // 绘制带圆角的矩形
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        
        // 设置绘制图形的颜色和透明度
        UIColor(white: 0.3, alpha: 0.8).setFill()
        
        // 设置填充模式
        roundedRect.fill()
        
        
        /**
         将Checkmark图片绘制到HUD上面
         */
        
        // 获取图片
        if let image = UIImage(named: "Checkmark") {
            
            // 确定需要绘制的点
            let imagePoint = CGPoint(x: center.x - round(image.size.width / 2), y: center.y - round(image.size.height / 2) - boxHeight / 8)

            // 在当前的上下文中指定的点绘制会骗
            image.draw(at: imagePoint)
        }
        
        
        /**
         将文字绘制到HUD上面
         */
        
        // 设置富文本字符串
        let attribs = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // 计算指定富文本内容所占用的边框大小
        let textSize = text.size(withAttributes: attribs)
        
        // 计算需要绘制的点
        let textPoint = CGPoint(x: center.x - round(textSize.width / 2), y: center.y - round(textSize.height / 2) + boxHeight / 4)
        
        // 在当前图形上下文中指定的点上绘制富文本字符串
        text.draw(at: textPoint, withAttributes: attribs)
    }
    
    /// 执行HUD动画
    func show(animated: Bool) {
        
        // 如果需要执行动画
        if animated {
            
            // 设置当前控件完全透明
            alpha = 0
            
            // 设置缩放
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
            // 执行UIView动画
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
                
                // 设置当前控件不透明
                self.alpha = 1
                
                // 清除transform
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    /// 隐藏HUD
    func hide() {
        
        // 设置父控件可交互
        superview?.isUserInteractionEnabled = true
        
        // 从父控件上面移除HUD
        removeFromSuperview()
    }
    
    
    
}
