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
        
        // MARK: - 1、加载GIF图片并将其转换为二进制数据
        
        // 获取GIF图片所在的路径
        guard let imagePath = Bundle.main.path(forResource: "猫咪.GIF", ofType: nil) else { return }
        
        // 将imagePath转成URL路径
        let imageURL = URL(fileURLWithPath: imagePath)
        
        // 将GIF图片转成Data
        let imageData = try! Data(contentsOf: imageURL)
        
        
        
        
        // MARK: - 2、将图片的二进制数据转换为CGImageSource
        
        // 将Data数据转换成CGImageSource数据
        guard let imageDataSource = CGImageSourceCreateWithData(imageData as CFData, nil) else { return }
        
        // 获取图片的帧数
        let imageCount = CGImageSourceGetCount(imageDataSource)
        
        
        
        
        // MARK: - 3、在沙盒中自定义目录，并且将分割的PNG图片写入目标文件夹
        
        // 获取应用所在的Documents目录
        let documentsDerectory = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        
        // 在Documents目录下创建自定义目录
        do {
            try FileManager.default.createDirectory(atPath: "\(documentsDerectory)/CatImages", withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            debugPrint(error)
        }
        
        // 遍历图片的总帧数
        for idx in 0..<imageCount {
            
            // 根据imageDataSource数据创建CGImage图片
            guard let imageRef = CGImageSourceCreateImageAtIndex(imageDataSource, idx, nil) else { return }
            
            
            // 根据已经创建的CGImage数据创建UIImage图片
            let image = UIImage(cgImage: imageRef, scale: UIScreen.main.scale, orientation: UIImage.Orientation.up)
            
            // 将UIImage图片转换成PNG形式的二进制数据
            guard let pngData: Data = image.pngData() else { return }
            
            // 拼接PNG图片的全路径
            let pngImagePath = documentsDerectory + "/CatImages/\(idx)" + ".png"
            
            // 将PNG图片写入目标路径
            try? pngData.write(to: URL(fileURLWithPath: pngImagePath), options: [.atomic])
        }
    }
    
    /// 在沙盒中Documents文件夹下面创建自定义目录
    func createDirectoryInSandbox() {
        
        // MARK: - 通过String的方式来创建文件夹
        
        // 获取沙盒中Documents文件夹所在路径的String
        let documentsString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        // 在Documents目录下创建自定义文件夹
        do {
            try FileManager.default.createDirectory(atPath: "\(documentsString)/Directory1", withIntermediateDirectories: true, attributes: nil)
            
        } catch let error {
            
            debugPrint(error)
        }
        
        // MARK: - 通过URL的方式来创建文件夹
        
        // 获取沙盒中Documents文件夹所在路径的URL
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        // 在Documents目录下创建新的文件夹
        do {
            try FileManager.default.createDirectory(at: documentsURL.appendingPathComponent("/Directory2"), withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            
            debugPrint(error)
        }
    }

    /// 获取沙盒中Documents、Library和tmp文件夹所在路径
    func getSandboxDirectorys() {
        
        // MARK: - 直接获取沙盒相关文件夹的String形式
        
        // 获取Documents的String形式
        // - 参数directory: 表示需要获取哪个文件夹。其中，documentDirectory表示Documents, libraryDirectory表示Library,
        //   cachesDirectory表示Caches)
        // - 参数domainMask: 用于限定文件的检索范围只限于沙箱内部，其意义为用户电脑主目录.也可以修改为网络主机等
        // - 参数expandTilde: 是否需要完整展开文件夹在沙盒中所在的路径。如果是true，则表示展开完整的沙盒路径；
        //   如果是false，则表示不展开，那么根目录将会用波浪号代替
        let documentsString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, false)[0]
        print(documentsString)
        
        // 获取Library的String形式
        let libraryString = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, false)[0]
        print(libraryString)
        
        // 获取Caches的String形式
        let cachesString = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, false)[0]
        print(cachesString)
        
        // MARK: - 获取沙盒相关文件夹的URL形式
        
        // 获取Documents的URL形式
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(documentsURL)
        
        // 获取Library的URL形式
        let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
        print(libraryURL)
        
        // 获取Caches的URL形式
        let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        print(cachesURL)
        
        // MARK: - 获取临时文件夹所在路径
        
        // 获取沙盒根目录
        let homeString = NSHomeDirectory()
        print(homeString)
        
        // 获取tmp文件夹的String形式
        let tmpString = NSTemporaryDirectory()
        print(tmpString)
    }
}

/*
static var userDomainMask: FileManager.SearchPathDomainMask
The user’s home directory—the place to install user’s personal items (~).
 
static var localDomainMask: FileManager.SearchPathDomainMask
Local to the current machine—the place to install items available to everyone on this machine.
 
static var networkDomainMask: FileManager.SearchPathDomainMask
Publicly available location in the local area network—the place to install items available on the network (/Network).
 
static var systemDomainMask: FileManager.SearchPathDomainMask
Provided by Apple—can’t be modified (/System) .
 
static var allDomainsMask: FileManager.SearchPathDomainMask
All domains.
*/
