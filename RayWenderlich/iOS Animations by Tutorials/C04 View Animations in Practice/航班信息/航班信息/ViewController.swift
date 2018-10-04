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
    
    /// 雪花发射器
    var snowView: SnowView!
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
        
        // 接入航班数据(默认是从上海飞哈尔滨)
        changeFlight(to: shanghaiToHaerbin)
    }

    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
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
    
    /// 改变航班
    private func changeFlight(to data: FlightData) {
        
        // 航班的起飞信息
        summaryLabel.text = data.summary
        
        // 航班号
        flightNr.text = data.flightNr
        
        // 登机口信息
        gateNr.text = data.gateNr
        
        // 起飞地信息
        departingFrom.text = data.departingFrom
        
        // 目的地信息
        arrivingTo.text = data.arrivingTo
        
        // 航班状态
        statusLabel.text = data.flightStatus
        
        // 切换背景图片
        bgImageView.image = UIImage(named: data.weatherImageName)
        
        // 隐藏雪花发射器
        snowView.isHidden = !data.showWeatherEffects
        
        
        // 切换到下一个航班
        delay(seconds: 3.0) {
            
            // 通过判断飞机是否起飞来切换数据
            // 如果飞机起飞，就接入哈尔滨飞三亚的数据
            // 如果延误，就接入上海飞哈尔滨的数据
            self.changeFlight(to: data.isTakingOff ? haerbinToSanya : shanghaiToHaerbin)
        }
    }

}

