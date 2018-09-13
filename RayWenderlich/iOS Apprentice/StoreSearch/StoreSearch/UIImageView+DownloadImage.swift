//
//  UIImageView+DownloadImage.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// 根据执行的URL路径来下载网络图片
    func loadImage(url: URL) -> URLSessionDownloadTask {
        
        // 创建默认的session
        let session = URLSession.shared
        
        // 使用默认的session和指定的URL路径，创建downloadTask
        // 这里之所以要使用[weak self]，主要原因是imageView是
        // tableViewCell的一个子控件，而控制器对它的父控件有一个
        // 强引用，然后我们这个闭包又对self有一个强引用，因此会产生
        // 循环引用。而使用[weak self]则可以打破循环引用
        let downloadTask = session.downloadTask(with: url) { [weak self] (url, response, error) in
            
            // (1)、先判断error是否为空，如果error为空，则说明下载没有出错
            // (2)、然后对url进行校验，如果url没有问题，则使用
            //      Data(contentsOf: )下载并将其转换为Data二进制数据
            // (3)、接着对data进行校验，如果data没有问题，则使用
            //      UIImage(data: )将Data类型的数据转换为UIImage图片
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                
                // 回到主线程中执行代码
                DispatchQueue.main.async {
                    
                    // 因为使用[weak self]修饰的self有可能为nil
                    // 为此，这里再使用之前必须对其进行校验
                    if let weakSelf = self {
                        
                        // 将图片设置到UIImageView的image上面
                        weakSelf.image = image
                    }
                }
            }
        }
        
        // 执行downloadTask，开始下载网络数据
        downloadTask.resume()
        
        // 返回downloadTask
        return downloadTask
    }
}
