//
//  ViewController.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    
    // MARK: - @IBOutlet
    
    /// 添加按钮
    @IBOutlet weak var itemAdd: UIBarButtonItem!
    
    /// 展示图片的控件
    @IBOutlet weak var imagePreview: UIImageView!
    
    /// 清除按钮
    @IBOutlet weak var buttonClear: UIButton!
    
    /// 保存按钮
    @IBOutlet weak var buttonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

