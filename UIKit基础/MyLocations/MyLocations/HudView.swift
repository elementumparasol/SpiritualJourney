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
    class func hud(inView view: UIView, animated: Bool) -> UIView {
        
        // 创建hudView
        let hudView = HudView(frame: view.bounds)
        
        // 设置hudView不透明
        hudView.isOpaque = false
        
        // 将hudView添加到当前view上面
        view.addSubview(hudView)
        
        // 设置view不可交互
        view.isUserInteractionEnabled = false
        
        // 设置hudView的背景颜色和透明度
        hudView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
        return hudView
    }
}
