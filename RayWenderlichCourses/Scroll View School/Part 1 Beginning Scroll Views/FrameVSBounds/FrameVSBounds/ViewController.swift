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
        
        // 获取frameXSlider和boundsXSlider的初始值
        frameXSlider.value = Float(containerView.frame.origin.x)
        boundsXSlider.value = Float(containerView.bounds.origin.x)
        
        // 获取FrameYSlider和boundsXSlider的初始值
        FrameYSlider.value = Float(containerView.frame.origin.y)
        boundsXSlider.value = Float(containerView.bounds.origin.y)
    }

    /// frame的origin.x的值的改变
    @IBAction func frameXSliderChanged(_ sender: Any) {
        
        // 将slider的值设置为containerView的frame的origin.x的值
        containerView.frame.origin.x = CGFloat(frameXSlider.value)
        
        // 将修改的值更新到对应的label上去
        updateValues()
    }
    
    /// bounds的origin.x的值的改变
    @IBAction func boundsXSliderChanged(_ sender: Any) {
        
        // 将slider的值设置为containerView的bounds的origin.x的值
        containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
        
        // 将修改的值更新到对应的label上去
        updateValues()
    }
    
    /// frame的origin.y的值的改变
    @IBAction func frameYSliderChanged(_ sender: Any) {
        
        // 将slider的值设置为containerView的frame的origin.y的值
        containerView.frame.origin.y = CGFloat(FrameYSlider.value)
        
        // 将修改的值更新到对应的label上去
        updateValues()
    }
    
    /// bounds的origin.y的值的改变
    @IBAction func boundsYSliderChanged(_ sender: Any) {
        
        // 将slider的值设置为containerView的bounds的origin.y的值
        containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
        
        // 将修改的值更新到对应的label上去
        updateValues()
    }
    
    /// 实时更改label上面的文本
    fileprivate func updateValues() {
        
        // 设置label上面的文字
        frameXLabel.text = "Frame x origin = \(Int(containerView.frame.origin.x))"
        boundsXLabel.text = "Bounds x origin = \(Int(containerView.bounds.origin.x))"
        FrameYLabel.text = "Frame y origin = \(Int(containerView.frame.origin.y))"
        boundsYLabel.text = "Bounds y origin = \(Int(containerView.bounds.origin.y))"
    }
}

