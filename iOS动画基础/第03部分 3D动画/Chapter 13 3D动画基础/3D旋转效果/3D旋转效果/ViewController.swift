//
//  ViewController.swift
//  3D旋转效果
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// imageView
    private lazy var imageView: UIImageView = {
        
        let screenWidth = UIScreen.main.bounds.size.width
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: screenWidth * 0.5, height: screenWidth * 0.5)))
        imageView.image = UIImage(named: "ShibaLnu.JPG")  // 注意，非PNG格式的图片必须把格式带上，且严格区分格式大小写
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        imageView.center = view.center
        view.addSubview(imageView)
        
        imageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(3)
        
        // 沿着x和z轴旋转45°
        imageView.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi * 0.25), 1, 0, 1)
        
        UIView.commitAnimations()
    }


}

