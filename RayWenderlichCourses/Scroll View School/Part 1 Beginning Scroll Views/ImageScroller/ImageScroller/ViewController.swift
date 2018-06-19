//
//  ViewController.swift
//  ImageScroller
//
//  Created by Enrica on 2018/6/18.
//  Copyright © 2018年 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - 控件属性
    
    /// scrollView控件
    @IBOutlet weak var scrollView: UIScrollView!
    
    /// imageView控件
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取imageView中图片的size
        guard let imageSize = imageView.image?.size else { return }
        
        // 设置scrollView的contentSize
        scrollView.contentSize = imageSize
        
        // 去掉编译器自动调整的安全区域(如果不设置这个属性，则顶部和底部都会有一个空白)
        scrollView.contentInsetAdjustmentBehavior = .never
        
        // 去掉滚动到边缘之后的弹簧效果
        scrollView.bounces = false
        
        
        // 设置代理
        scrollView.delegate = self
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = 1.0
    }

    /**
     * scrollView的contentSize已经在storyboard中用KVC的方式设置过了
     * 在scrollView中，如果不设置contentSize，那么它就无法实现滚动
     */
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    
    //
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
