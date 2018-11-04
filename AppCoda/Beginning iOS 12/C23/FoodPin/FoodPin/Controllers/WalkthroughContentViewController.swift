//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    ///
    @IBOutlet weak var headingLabel: UILabel! {
        
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    ///
    @IBOutlet weak var subHeadingLabel: UILabel! {
        
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    
    ///
    @IBOutlet weak var contentImageView: UIImageView!
    
    
    // MARK: - 自定义属性
    
    /// 当前页面的下标值
    var index = 0
    
    /// 标题
    var heading = ""
    
    /// 副标题
    var subHeading = ""
    
    /// 图片名称
    var imageName = ""
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageName)
    }

}
