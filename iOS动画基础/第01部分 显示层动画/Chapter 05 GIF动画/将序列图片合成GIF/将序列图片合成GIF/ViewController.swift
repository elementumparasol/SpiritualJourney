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
        
        // 将一序列的PNG图片合成GIF图片
        getGIFImageFromPNGImages()
    }
    
    func getGIFImageFromPNGImages() {
        
        // MARK: - 1、读取序列图片
        
        // 创建[UIImage]数组，用于存放图片
        var images: [UIImage] = []
        
        // 遍历本机序列图片
        for i in 0...36{
            
            // 获取图片的名称
            let imageName = "\(i).png"
            
            // 获取图片
            guard let image = UIImage(named: imageName) else { return }
            
            // 将图片添加到数组中
            images.append(image)
        }
        
        
        // MARK: - 2、在Document目录创建GIF文件
        
        // 获取沙盒中Documents文件夹所在路径
        let documentsString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        // 在沙盒中的Documents目录下新建自定义文件夹
        do {
            try FileManager.default.createDirectory(atPath: "\(documentsString)/GIF", withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            debugPrint(error)
        }
        
        // 创建GIF文件最终的存放路径
        let gifPath = documentsString + "/GIF/kanna.gif"// 构建Doc目录下gif文件路径
        
        print(NSHomeDirectory())  // 或者打一个断点，在控制台输入: po NSHomeDirectory()，然后回车
        
        // 将GIF的路径有String类型转换为CFURL类型
        guard let gifURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, gifPath as CFString, CFURLPathStyle.cfurlposixPathStyle, false) else { return }
        
        // 创建图片的目标对象
        // - url: 需要写入的目标URL路径(The URL to write to. If the URL already exists, the data at this location is overwritten)
        // - type: 图片类型(The UTI (uniform type identifier) of the resulting image file)
        // - count: 图片的帧数(The number of images (not including thumbnail images) that the image file will contain)
        // - options: 图片的属性(Reserved for future use. Pass NULL)
        guard let imageDestination = CGImageDestinationCreateWithURL(gifURL, kUTTypeGIF, images.count, nil) else { return }
        
        
        // MARK: - 3、设置GIF图片属性，利用本地图片序列合成GIF图像
        
        // 设置每一帧的播放时间
        let cgImagePropertyGIFDelayTime = [kCGImagePropertyGIFDelayTime as String:0.15]
        
        // 创建一个GIF图片属性字典
        let cgImagePropertyGIFDictionary = [kCGImagePropertyGIFDictionary as String: cgImagePropertyGIFDelayTime]
        
        // 遍历数组images，取出里面存放的序列图片
        for image in images{
            
            // 将图片添加到GIF图片的Destination中(Adds an image to an image destination)
            // - idst: image destination
            // - image: The image to add.
            // - properties: An optional dictionary that specifies the properties of the added image
            CGImageDestinationAddImage(imageDestination, (image as AnyObject).cgImage!, cgImagePropertyGIFDictionary as CFDictionary?)
        }
        
        // 创建一个可变字典，用于设置GIF图片中每一帧的属性
        let gifPropertiesDictionary:NSMutableDictionary = NSMutableDictionary()
        
        // 设置图片的彩色空间格式为RGB形式
        gifPropertiesDictionary.setValue(kCGImagePropertyColorModelRGB, forKey: kCGImagePropertyColorModel as String)
        
        // 设置图像的颜色深度
        // 一般来说黑白图像也称为二值图像，颜色深度为1，表示2的一次方，即两种颜色：黑和白。灰度图像一般颜色深度为8，
        // 表示2的8次方，共计256种颜色，即从黑色到白色的渐变过程有256种。对于彩色图片来说一般有16位深度和32位深度
        // 之说，这里设置为16位深度彩色图片
        gifPropertiesDictionary.setValue(16, forKey: kCGImagePropertyDepth as String)
        
        // 设置GIF图片执行次数
        gifPropertiesDictionary.setValue(1, forKey: kCGImagePropertyGIFLoopCount as String)
        
        // 还是创建GIF图片属性字典
        let gifPropertyDictionary = [kCGImagePropertyGIFDictionary as String: gifPropertiesDictionary]
        
        // 为生成的GIF图像设置属性
        CGImageDestinationSetProperties(imageDestination,gifPropertyDictionary as CFDictionary?)
        
        // 写入GIF图片(Writes image data and properties to the data, URL, or data consumer associated with the image destination)
        // - idst: An image destination
        CGImageDestinationFinalize(imageDestination)
    }
}
