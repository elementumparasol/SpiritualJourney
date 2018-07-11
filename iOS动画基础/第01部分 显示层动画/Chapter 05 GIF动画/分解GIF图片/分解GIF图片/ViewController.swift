//
//  ViewController.swift
//  分解GIF图片
//
//  Created by Enrica on 2018/7/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import ImageIO

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取GIF图片所在的路径
        guard let imagePath = Bundle.main.path(forResource: "猫咪.GIF", ofType: nil) else { return }
        
        // 将imagePath转成URL路径
        let imageURL = URL(fileURLWithPath: imagePath)
        
        // 将GIF图片转成Data
        let imageData = try! Data(contentsOf: imageURL)
        
        // 将Data数据转换成CGImageSource
        guard let imageDataSource = CGImageSourceCreateWithData(imageData as CFData, nil) else { return }
        
        // 获取图片的帧数
        let imageCount = CGImageSourceGetCount(imageDataSource)
        
        // 遍历图片的总帧数
        for idx in 0..<imageCount {
            
            // 根据imageDataSource创建CGImage
            guard let imageRef = CGImageSourceCreateImageAtIndex(imageDataSource, idx, nil) else { return }
            
            
            // 根据已经创建的CGImage数据创建UIImage图片
            let image = UIImage(cgImage: imageRef, scale: UIScreen.main.scale, orientation: UIImage.Orientation.up)
        }
    }


}

