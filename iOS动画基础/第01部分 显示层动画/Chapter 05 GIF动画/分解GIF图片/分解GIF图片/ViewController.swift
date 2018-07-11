//
//  ViewController.swift
//  分解GIF图片
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取GIF图片所在的路径
        guard let imagePath = Bundle.main.path(forResource: "猫咪.GIF", ofType: nil) else { return }
        
        // 将imagePath转成URL路径
        let imageURL = URL(fileURLWithPath: imagePath)
        
        // 将GIF图片转成Data
        let imageData = try! Data(contentsOf: imageURL)
        
        print(imageData)
    }


}

