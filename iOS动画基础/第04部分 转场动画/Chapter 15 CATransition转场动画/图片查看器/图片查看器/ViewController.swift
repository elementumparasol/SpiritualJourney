//
//  ViewController.swift
//  图片查看器
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// imageView
    private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "0.jpeg")
        
        // UIImageView对象默认是没有用户交互的，因此需要手动开启
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    /// 图片计数
    private var imageCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        
        // 创建点击手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGestureClick))
        
        // 给imageView添加点击手势
        imageView.addGestureRecognizer(tapGesture)
    }


}

// MARK: - 监听手势
extension ViewController {
    
    
    @objc func tapGestureClick() {
        
        // 计数加一
        imageCount += 1
        
        // 图片的数量不能大于8章
        if imageCount > 8 {
            
            // 确保再次加载图片时，可以取到名字为0的图片
            imageCount = 0
        }
        
        // 切换图片
        imageView.image = UIImage(named: "\(imageCount).jpeg")
        
        // 创建CATransition转场动画
        let animation = CATransition()
        animation.duration = 1
        animation.type = CATransitionType(rawValue: "cameraIrisHollowOpen")  // 相机中心向四周三开
        imageView.layer.add(animation, forKey: nil)
    }
}

//  animation.type = CATransitionType(rawValue: "oglFlip")  // 上下翻滚
//  animation.type = CATransitionType(rawValue: "cube")  // 立方体
//  animation.type = CATransitionType(rawValue: "suckEffect")  // 左上角飞出
//  animation.type = CATransitionType(rawValue: "rippleEffect")  // 水波荡漾
//  animation.type = CATransitionType(rawValue: "pageUnCurl")  // 左上角向下翻页
//  animation.type = CATransitionType(rawValue: "pageCurl")  // 右下角向上翻页
//  animation.type = CATransitionType(rawValue: "cameraIrisHollowOpen")  // 相机中心向四周三开
//  animation.type = CATransitionType(rawValue: "cameraIrisHollowClose")  // 相机四周向中心聚拢
//  animation.type = CATransitionType(rawValue: "kCATransitionFade")  // 淡化
//  animation.type = CATransitionType(rawValue: "kCATransitionPush")  // 还是淡化
//  animation.type = CATransitionType(rawValue: "kCATransitionReveal")  // 还是淡化
//  animation.type = CATransitionType(rawValue: "kCATransitionMoveIn")  // 还是淡化
//  animation.subtype = CATransitionSubtype.fromRight  // 淡入淡出
