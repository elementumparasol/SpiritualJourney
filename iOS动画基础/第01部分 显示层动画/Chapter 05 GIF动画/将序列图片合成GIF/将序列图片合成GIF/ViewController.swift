//
//  ViewController.swift
//  将序列图片合成GIF
//
//  Created by Enrica on 2018/7/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 1、读取序列图片
        
        // 创建数组，用于存放图片
        var images: [UIImage] = []
        
        for idx in 0...36 {
            
            // 拼接图片名称
            let imageName = "\(idx).png"
            
            // 创建图片
            guard let image = UIImage(named: imageName) else { return }
            
            // 将图片存入数组中
            images.append(image)
        }
    }


}

