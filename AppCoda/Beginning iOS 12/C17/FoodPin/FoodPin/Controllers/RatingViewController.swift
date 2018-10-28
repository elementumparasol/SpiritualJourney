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
    
    /// 评价按钮
    @IBOutlet var rateButtons: [UIButton]!
    
    
    // MARKK: - 自定义属性
    
    /// 用于存储有外部控制器传递过来的restaurant模型数据
    var restaurant = Restaurant()
    
    
    // MARK: - 类自带的方法
    
    // viewWillAppear方法会在控件被夹在进内存，但是还未
    // 真正显示在屏幕之前调用(也就是在viewDidLoad之后)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 重新设置按钮的alpha值为1
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            
            // 重新显示按钮(设置按钮不透明)
            self.rateButtons[0].alpha = 1.0
            
            // 重新将按钮回归到原始位置
            self.rateButtons[0].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
            self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
        }, completion: nil)
        
    }

    // viewDidLoad方法在首次加载视图控件时会
    // 调用，但此时控件还未显示到屏幕上。如果将
    // 添加动画的代码写在这里，那么很有可能动画
    // 过早开始，甚至是控件显示在屏幕上时，动画
    // 就已经执行完成了。所以，最好是将执行动画
    // 的代码写在控件即将出现之前的方法中
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
    }
    
    deinit {
        print("RatingViewController --- 被销毁了")
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
        
        // 给评价按钮添加Transform形变
        buttonTransform()
    }
    
    /// 给按钮添加形变(等按钮即将显示时，再将其还原)
    private func buttonTransform() {
        
        // 创建一个偏移量
        let moveRightTransform = CGAffineTransform.init(translationX: UIScreen.main.bounds.width, y: 0)
        
        // 让控件在原始基础上放大5倍
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        
        // 将偏移量和放大效果结合起来
        // concatenating方法可以将两种效果结合起来使用
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // 遍历数组，取出按钮
        for rateButton in rateButtons {
            
            // 设置按钮的alpha值为0
            rateButton.alpha = 0
            
            // 设置按钮的偏移量和放大效果
            rateButton.transform = moveScaleTransform
        }
    }

}
