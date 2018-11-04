//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    // MARK: - @IBOutlet
    
    /// 分页指示器pageControl
    @IBOutlet weak var pageControl: UIPageControl!
    
    /// 跳转到下一个页面的按钮nextButton
    @IBOutlet weak var nextButton: UIButton! {
        
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    /// 跳过当前步骤的按钮skipButton
    @IBOutlet weak var skipButton: UIButton!
    
    
    // MARK: - 自定义属性
    
    /// walkthroughPageViewController
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 获取目标控制器
        let destination = segue.destination
        
        // 给目标控制器中的walkthroughPageViewController属性赋值
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            
            // 设置代理(成为WalkthroughPageViewController的代理)
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    
    
    // MARK: - @IBAction
    
    /// 点点nextButton之后需要执行的代码
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        // 获取当前控制器的index
        if let index = walkthroughPageViewController?
            .currentIndex {
            
            switch index {
                
            case 0...1:
                
                // 切换到下一个控制器
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                
                // 如果用户已经完成了walkthrough，就将状态存储起来
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                
                // 移除当前控制器
                dismiss(animated: true, completion: nil)
                
            default:
                break
            }
        }
        
        // 更新控制器上面按钮的UI界面
        updateUI()
    }
    
    /// 点击skipButton之后需要执行的代码
    @IBAction func skipButtonTapped(_ sender: Any) {
        
        // 如果用户已经完成了walkthrough，就将状态存储起来
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        
        // 退出当前控制器
        dismiss(animated: true, completion: nil)
    }

    
    // MARK: - 自定义方法
    
    /// 更新NEXT按钮、Skip按钮，以及pageControl的UI界面
    private func updateUI() {
        
        // 获取当前控制器的index
        if let index = walkthroughPageViewController?
            .currentIndex {
            
            // 对页面上面按钮进行处理
            switch index {
                
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
                
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
                
            default:
                break
            }
            
            // 切换pageControl的指示器
            pageControl.currentPage = index
        }
    }
    
    // MARK: - WalkthroughPageViewControllerDelegate
    func didUpdatePageIndex(currentIndex: Int) {
        
        // 更新UI界面
        updateUI()
    }
}


