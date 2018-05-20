//
//  ViewController.swift
//  BullsEye
//
//  Created by Enrica on 2018/5/15.
//  Copyright © 2018年 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - 自定义属性
    
    /** 用于保存滑块slider的数值 */
    var currentValue: Int = 50

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
        
        let message = "The value of this slider is \(currentValue)."
        
        // 创建Alert控制器
        let alert = UIAlertController(title: "Hello, World!",
                                      message: message,
                                      preferredStyle: .alert)
        
        // 创建Action(defalut, cancel和destructive三种)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        // 将action添加到alert中
        alert.addAction(action)
        
        // 弹出alert控制器
        present(alert, animated: true, completion: nil)
    }
    
    // The difference between the two is that a function doesn’t belong to an
    // object while a method does.
    // Swift中函数和方法的区别: 函数不属于对象，而方法是对象的一部分。函数可以脱离对象而存在
    // 但是方法不行，方法是对象内部的组成部分。比如说，像lroundf()就是一个函数，任何对象都可
    // 以调用它，但是想sizeToFit()就是一个方法，它不能脱离特定的对象而独立存在
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        
        // 将slider的值保存到变量currentValue中
        currentValue = lroundf(slider.value)
    }

}

