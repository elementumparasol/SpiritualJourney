//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
