//
//  ViewController.swift
//  航班信息
//
//  Created by Enrica on 2018/10/3.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 背景图片
    @IBOutlet weak var bgImageView: UIImageView!
    
    /// 顶部用于显示起飞信息的图标
    @IBOutlet weak var summaryIcon: UIImageView!
    
    /// 顶部用于显示航班起飞信息的label
    @IBOutlet weak var summaryLabel: UILabel!
    
    /// 航班号
    @IBOutlet weak var flightNr: UILabel!
    
    /// 登机口
    @IBOutlet weak var gateNr: UILabel!
    
    /// 出发地
    @IBOutlet weak var departingFrom: UILabel!
    
    /// 目的地
    @IBOutlet weak var arrivingTo: UILabel!
    
    /// 用于显示飞机的图片控件
    @IBOutlet weak var planeImage: UIImageView!
    
    /// 用于显示航班状态的控件
    @IBOutlet weak var statusImage: UIImageView!
    
    /// 飞行状态
    @IBOutlet weak var statusLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    /// 雪花
    var snowView: SnowView!
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** 1、处理顶部航班起飞信息 */
        
        // 将summaryIcon添加到summaryLabel上面
        summaryLabel.addSubview(summaryIcon)
        
        // 设置summaryIcon中心点y的坐标
        summaryIcon.center.y = summaryLabel.frame.size.height / 2.0
        
        
        /** 2、添加雪花 */
        
        // 创建雪花发射器，坐标为负数表示将其隐藏在屏幕外面
        snowView = SnowView(frame: CGRect(x: -150, y: -100, width: 300, height: 50))
        
        // 创建一个UIView实例snowClipView，用于作为雪花snowView的容器
        // 以方便后续整体操作。y轴向下偏移50，主要是为了不遮住顶部航班信息
        let snowClipView = UIView(frame: view.frame.offsetBy(dx: 0, dy: 50))
        
        // 将超出边界的部分裁剪掉(主要是为了让顶部显示航班信息的不为不出现雪花)
        snowClipView.clipsToBounds = true
        
        // 将雪花发射器添加到容器控件snowClipView上面
        snowClipView.addSubview(snowView)
        
        // 将容器控件snowClipView添加到控制器的view上面
        view.addSubview(snowClipView)
    }

    
    // MARK: - 自定义方法
    

}

