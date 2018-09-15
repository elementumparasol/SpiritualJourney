//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - 枚举常量
    
    /// 动画切换样式
    enum AnimationStyle {
        
        /// 幻灯片效果
        case slide
        
        /// 逐渐消失
        case fade
    }  // 注意，因为是定义在DetailViewController内部
       // 所以，这个枚举的全名应该是DetailViewController.AnimationStyle
    
    
    // MARK: - @IBOutlet
    
    /// 容器控件popupView
    @IBOutlet weak var popupView: UIView!
    
    /// 显示插图的控件artworkImageView
    @IBOutlet weak var artworkImageView: UIImageView!
    
    /// 显示名称的控件nameLabel
    @IBOutlet weak var nameLabel: UILabel!
    
    /// 显示艺术家名字的控件artistNameLabel
    @IBOutlet weak var artistNameLabel: UILabel!
    
    /// 显示分类的控件kindLabel
    @IBOutlet weak var kindLabel: UILabel!
    
    /// 显示类型或者流派的控件genreLabel
    @IBOutlet weak var genreLabel: UILabel!
    
    /// 显示价格的按钮priceButton
    @IBOutlet weak var priceButton: UIButton!
    
    
    // MARK: - 自定义属性
    
    /// 用于保存搜索结果
    var searchResult: SearchResult!
    
    /// 用于保存downloadTask
    var downloadTask: URLSessionDownloadTask?
    
    /// 动画效果
    var dismissStyle = AnimationStyle.fade
    
    
    // MARK: - @IBAction
    
    /// 点击按钮关闭
    @IBAction func close() {
        
        // 选择关闭时的动画样式
        dismissStyle = .slide
        
        // 退出当前控制器
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - 类自带的方法
    
    // 从storyboard中加载控制器时调用
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // 使用自定义的presentation
        modalPresentationStyle = .custom
        
        // 设置代理
        transitioningDelegate = self
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 重新设置本界面的tintColor
        view.tintColor = UIColor(red: 20/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1.0)
        
        // 裁剪popupView为圆角
        popupView.layer.cornerRadius = 10
        
        
        // 创建tapGesture手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(close))
        tapGesture.cancelsTouchesInView = false
        
        // 设置手势代理
        tapGesture.delegate = self
        
        // 将tapGesture手势添加到当前控制器的view上面
        view.addGestureRecognizer(tapGesture)
        
        // 设置UI界面(更新poppuView上面的数据)
        if searchResult != nil {
            setupUI()
        }
        
        // 设置背景颜色为透明
        view.backgroundColor = .clear
    }
    
    // 控制器实例对象被销毁的时候调用
    deinit {
        print("deinit: \(self)")
        
        // 取消下载
        downloadTask?.cancel()
    }
    
    
    
    // MARK: - 自定义方法
    
    /// 设置UI界面
    func setupUI() {
        
        /**
         显示各种label上面的数据
         */
        
        // 显示nameLabel的数据
        nameLabel.text = searchResult.name
        
        // 显示artistNameLabel上面的数据
        if searchResult.artistName.isEmpty {
            artistNameLabel.text = "Unknown"
        } else {
            artistNameLabel.text = searchResult.artistName
        }
        
        // 显示kindLabel上面的数据
        kindLabel.text = searchResult.type
        
        // 显示genreLabel上面的数据
        genreLabel.text = searchResult.genre
        
        
        /**
         显示价格按钮上面的数据
         */
        
        // 创建NumberFormatter对象，用于转换字符对象为数值对象
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency  // 货币类型
        formatter.currencyCode = searchResult.currency
        
        // 对price的不同情况进行处理
        let priceText: String
        if searchResult.price == 0 {
            priceText = "Free"
        } else if let text = formatter.string(from: searchResult.price as NSNumber) {
            priceText = text
        } else {
            priceText = ""
        }
        
        // 将最终的价格设置到按钮上面去
        priceButton.setTitle(priceText, for: .normal)
        
        
        /**
         显示插图数据
         */
        
        // 对插图的URL路径进行校验
        if let largeURL = URL(string: searchResult.imageLarge) {
            
            // 开始下载插图数据
            downloadTask = artworkImageView.loadImage(url: largeURL)
        }
    }
    

    
    
    
}



// MARK: - UIViewControllerTransitioningDelegate
extension DetailViewController: UIViewControllerTransitioningDelegate {
    
    // 这个代理协议中的方法，主要是来告诉UIKit，使用那个对象来执行跳转到当前控制器
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        // init(presentedViewController:presenting:)这个构造方法主要是
        // 用于初始化并返回一个presentation控制器，以便于在指定的控制器之间跳转
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    // 自定义转场动画(present)
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return BounceAnimationController()
    }
    
    // 自定义转场动画(dismiss)
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // 根据dismissStyle的值来执行相应的动画
        switch dismissStyle {
        case .slide:
            return SlideOutAnimationController()
        case .fade:
            return FadeOutAnimationController()
        }
    }
}


// MARK: - UIGestureRecognizerDelegate
extension DetailViewController: UIGestureRecognizerDelegate {
    
    // 询问代理，手势识别器是否需要接收触摸对象(也就是UIGestureRecognizer)
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        // 只有当touch在当前控制器的view上面时，才会返回true
        // 如果touch在popupView内部，则返回false
        return (touch.view === self.view)  // ===用来判断它们是否引用同一个对象
    }
}
