//
//  ViewController.swift
//  Install RxSwift
//
//  Created by Enrica on 2018/8/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = Observable.of("Hello, RxSwift!")
    }


}

