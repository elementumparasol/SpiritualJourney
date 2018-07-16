//
//  ViewController.swift
//  音量震动
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 屏幕的宽度和高度
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // MARK: - 创建复制层CAReplicatorLayer
        
        // 创建CAReplicatorLayer对象
        let replicatorLayer = CAReplicatorLayer()
        
        // 设置replicatorLayer的frame
        replicatorLayer.frame = CGRect(x: 0, y: (screenHeight - 200) * 0.5, width: screenWidth, height: 200)
        
        // 设置赋值层(也就是音量震动条)的个数
        replicatorLayer.instanceCount = 18;
        
        // 每个复制出来的震动条相对于上一个而言，平移多少
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        // 设置震动条的延时(也就是每一个震动条相对于上一个震动条而言，它的形变延时多长时间)
        replicatorLayer.instanceDelay = 0.2
        
        // 将超出replicatorLayer层的震动条裁剪掉
        replicatorLayer.masksToBounds = true
        
        // 设置replicatorLayer的背景颜色
        replicatorLayer.backgroundColor = UIColor.lightGray.cgColor;
        
        
        
        // MARK: - 创建CALayer音量震动条
        
        // 创建CALayer(也就是音量条)对象
        let layer = CALayer()
        
        // 设置音量条的frame
        layer.frame = CGRect(x: 14, y: 350, width: 10, height: 100)
        
        // 设置音量条的背景颜色
        layer.backgroundColor = UIColor.green.cgColor
        
        // 将音量条添加到replicatorLayer上面
        replicatorLayer.addSublayer(layer)
        
        // 将replicatorLayer添加到当前控制器的view上
        view.layer.addSublayer(replicatorLayer)
        
        
        
        // MARK: - 创建基础动画CABasicAnimation
        
        // 创建基础动画对象
        let animation = CABasicAnimation()
        
        // 设置动画的keyPath为y轴上的位置动画
        animation.keyPath = "position.y"
        
        // 设置动画执行时长
        animation.duration = 0.5
        
        // 设置fromValue
        animation.fromValue = 200
        
        // 设置toValue
        animation.toValue = 180
        
        // 设置动画是否反转
        animation.autoreverses = true
        
        // 设置动画重复的次数
        animation.repeatCount = MAXFLOAT
        
        // 将动画添加到音量条layer上
        layer.add(animation, forKey: nil)
    }
}

