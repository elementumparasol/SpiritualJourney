//
//  ViewController.swift
//  将序列图片合成GIF
//
//  Created by Enrica on 2018/7/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import ImageIO
import MobileCoreServices

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
        
        
        // MARK: - 在Documents文件夹下建立存储GIF图片的目录
        
        // 获取Documents在沙盒中的全路径
        let documentsString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        // 在Documents目录下新建一个文件夹，用于存储合成之后的GIF图片
        do {
            try FileManager.default.createDirectory(atPath: "\(documentsString)/GIF/FunnyKanna.gif", withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            debugPrint(error)
        }
        
        // 拼接目标文件的全路径
        let gifPath = documentsString + "/GIF/FunnyKanna.gif"
        
        print(documentsString)
        
        // 将目标文件FunnyKanna.gif的String路径转换为URL路径
        guard let url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, gifPath as CFString, .cfurlposixPathStyle, false) else { return }
        
        // 创建图片的目标对象
        // - url: 需要写入的目标URL路径(The URL to write to. If the URL already exists, the data at this location is overwritten)
        // - type: 图片类型(The UTI (uniform type identifier) of the resulting image file)
        // - count: 图片的帧数(The number of images (not including thumbnail images) that the image file will contain)
        // - options: 图片的属性(Reserved for future use. Pass NULL)
        let imageDestination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, nil)
        
        
        
        
    }


}

/*
url - The URL to write to. If the URL already exists, the data at this location is overwritten.

type - The UTI (uniform type identifier) of the resulting image file. See Uniform Type Identifiers Overview for a list of system-declared and third-party UTIs.

count - The number of images (not including thumbnail images) that the image file will contain.

options - Reserved for future use. Pass NULL.
*/
