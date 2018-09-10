//
//  MyImagePickerController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/9.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class MyImagePickerController: UIImagePickerController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

