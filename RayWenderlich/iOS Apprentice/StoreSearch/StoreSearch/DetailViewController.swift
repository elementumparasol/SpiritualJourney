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

        // Do any additional setup after loading the view.
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
