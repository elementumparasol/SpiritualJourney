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
    
    /// summaryIcon
    @IBOutlet weak var summaryIcon: UIImageView!
    
    /// summaryLabel
    @IBOutlet weak var summaryLabel: UILabel!
    
    /// flightNr
    @IBOutlet weak var flightNr: UILabel!
    
    /// gateNr
    @IBOutlet weak var gateNr: UILabel!
    
    /// 出发地
    @IBOutlet weak var departingFrom: UILabel!
    
    /// 目的地
    @IBOutlet weak var arrivingTo: UILabel!
    
    /// planeImage
    @IBOutlet weak var planeImage: UIImageView!
    
    /// statusBanner
    @IBOutlet weak var statusImage: UIImageView!
    
    /// flightStatus
    @IBOutlet weak var statusLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    /// 雪花
    var snowView: SnowView!
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    // MARK: - 自定义方法
    

}

