//
//  ViewController.swift
//  Asynchronous code
//
//  Created by Enrica on 2018/9/19.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = [1, 2, 3]
    var currentIndex = 0
    
    @IBAction func printNext(_ sender: Any) {
        
        print(array[currentIndex])
        
        if currentIndex != array.count - 1 {
            currentIndex += 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

