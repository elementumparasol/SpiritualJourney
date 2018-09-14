//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/14.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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
    
    
    // MARK: - @IBAction
    
    /// 点击按钮关闭
    @IBAction func close() {
        
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
