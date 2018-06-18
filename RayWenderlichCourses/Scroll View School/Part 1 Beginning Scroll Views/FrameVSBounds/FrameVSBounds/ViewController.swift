//
//  ViewController.swift
//  FrameVSBounds
//
//  Created by Enrica on 2018/6/18.
//  Copyright © 2018年 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 控件属性
    
    /// 容器控件
    @IBOutlet weak var containerView: UIView!
    
    /// 内部控件
    @IBOutlet weak var innerView: UIView!
    
    /// 显示frame的origin.x的label
    @IBOutlet weak var frameXLabel: UILabel!
    
    /// 控制frame的origin.x的slider
    @IBOutlet weak var frameXSlider: UISlider!
    
    /// 显示bounds的origin.x的label
    @IBOutlet weak var boundsXLabel: UILabel!
    
    /// 控制bounds的origin.x的slider
    @IBOutlet weak var boundsXSlider: UISlider!
    
    /// 显示frame的origin.y的label
    @IBOutlet weak var FrameYLabel: UILabel!
    
    /// 控制frame的origin.y的slider
    @IBOutlet weak var FrameYSlider: UISlider!
    
    /// 显示bounds的origin.y的label
    @IBOutlet weak var boundsYLabel: UILabel!
    
    /// 控制bounds的origin.y的slider
    @IBOutlet weak var boundsYSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

