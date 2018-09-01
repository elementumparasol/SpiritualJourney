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
    
    /// textView控件
    @IBOutlet weak var descriptionTextView: UITextView!
    
    /// categoryLabel控件
    @IBOutlet weak var categoryLabel: UILabel!
    
    /// latitudeLabel控件
    @IBOutlet weak var latitudeLabel: UILabel!
    
    /// longitudeLabel控件
    @IBOutlet weak var longitudeLabel: UILabel!
    
    /// addressLabel控件
    @IBOutlet weak var addressLabel: UILabel!
    
    /// dateLabel控件
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
