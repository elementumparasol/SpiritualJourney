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

        // 设置图片的缩放功能
        setZoomForSize(scrollView.bounds.size)
        
        // 将图片设置到中间的位置
        recenterImage()
    }
    
    // 检测到屏幕旋转时会调用这个方法
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setZoomForSize(scrollView.bounds.size)
        recenterImage()
    }

    // 计算图片的缩放比例
    func setZoomForSize(_ scrollViewSize: CGSize) {

        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
    
    // 将图片设置到屏幕中间的位置
    func recenterImage() {
        
        // 获取scrollView的size
        let scrollViewSize = scrollView.bounds.size
        
        // 获取图片的size
        let imageSize = imageView.frame.size
        
        // 计算水平方向上的空白
        let horizontalSpace = imageSize.width < scrollViewSize.width ? (scrollViewSize.width - imageSize.width) / 2.0 : 0
        
        // 计算垂直方向上的空白
        let verticalSpace = imageSize.height < scrollViewSize.height ? (scrollViewSize.height - imageSize.height) / 2.0 : 0
        
        // 重新设置scrollView的contentInset
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {

    // 缩放视图
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
