//
//  ViewController.swift
//  BullsEye
//
//  Created by Enrica on 2018/5/15.
//  Copyright © 2018年 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK:- IBAction
    @IBAction func showAlert() {
        
        // 创建Alert控制器
        let alert = UIAlertController(title: "Hello, World!",
                                      message: "This is my first app!",
                                      preferredStyle: .alert)
        
        // 创建Action(defalut, cancel和destructive三种)
        let action = UIAlertAction(title: "Awesome",
                                   style: .default,
                                   handler: nil)
        
        // 将action添加到alert中
        alert.addAction(action)
        
        // 弹出alert控制器
        present(alert, animated: true, completion: nil)
    }

}

