//
//  RatingViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/28.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    // MARKK: - 自定义属性
    
    /// 用于存储有外部控制器传递过来的restaurant模型数据
    var restaurant = Restaurant()
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
    }
    
    
    // MARK: - @IBAction
    
    /// 点击关闭按钮，dismiss当前控制器
    @IBAction func close(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 设置背景图片
        backgroundImageView.image = UIImage(named: restaurant.imageName)
        
        // 设置图片的填充模式
        backgroundImageView.contentMode = .scaleAspectFill
        
        // 设置毛玻璃效果
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }
    

}
