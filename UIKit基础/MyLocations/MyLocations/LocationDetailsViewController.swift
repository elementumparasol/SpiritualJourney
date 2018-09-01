//
//  LocationDetailsViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/1.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class LocationDetailsViewController: UITableViewController {
    
    // MARK: - @IBOutlet
    
    ///
    @IBOutlet weak var descriptionTextView: UITextView!
    
    ///
    @IBOutlet weak var categoryLabel: UILabel!
    
    ///
    @IBOutlet weak var latitudeLabel: UILabel!
    
    ///
    @IBOutlet weak var longitudeLabel: UILabel!
    
    ///
    @IBOutlet weak var addressLabel: UILabel!
    
    ///
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // MARK: - @IBAction
    
    
    /// 点击导航栏上面的完成按钮
    @IBAction func done() {
        
        // 从导航栏堆栈中退出栈顶控制器
        navigationController?.popViewController(animated: true)
    }
    
    /// 点击导航栏上面的取消按钮
    @IBAction func cancel() {
        
        // 从导航栏堆栈中退出栈顶控制器
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - 类自带的方法
    
    /// 控制器view即将显示的时候调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 显示导航条
        navigationController?.isNavigationBarHidden = false
    }
}
