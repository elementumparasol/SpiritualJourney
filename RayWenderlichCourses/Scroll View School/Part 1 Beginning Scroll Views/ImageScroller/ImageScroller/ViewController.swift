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
//        scrollView.contentSize = imageSize  // 如果需要对scrollView中的内容进行滚动，则需要设置它的contentSize
        imageView.frame.size = imageSize

        if #available(iOS 11.0, *) {

            // 去掉编译器自动调整的安全区域(如果不设置这个属性，则顶部和底部都会有一个空白)
            scrollView.contentInsetAdjustmentBehavior = .never
        }

        // 去掉滚动到边缘之后的弹簧效果
        scrollView.bounces = false


        // 设置代理
        scrollView.delegate = self


        setZoomForSize(scrollView.bounds.size)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setZoomForSize(scrollView.bounds.size)
    }

    func setZoomForSize(_ scrollViewSize: CGSize) {

        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {

    // 缩放视图
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
