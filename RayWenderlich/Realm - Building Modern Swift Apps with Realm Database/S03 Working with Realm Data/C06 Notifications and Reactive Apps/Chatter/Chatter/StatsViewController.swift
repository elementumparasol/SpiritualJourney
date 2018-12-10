//
//  StatsViewController.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 显示消息数量的label
    @IBOutlet weak var statsLabel: UILabel!
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statsLabel.text = "Total messages: 10000"
    }


}

