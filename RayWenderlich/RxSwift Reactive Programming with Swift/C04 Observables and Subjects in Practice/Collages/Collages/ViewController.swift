//
//  ViewController.swift
//  Collages
//
//  Created by Enrica on 2018/11/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var imageView: UIImageView! {
        
        didSet {
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 10.0
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    /// clearButton
    @IBOutlet weak var clearButton: UIButton! {
        
        didSet {
            clearButton.layer.masksToBounds = true
            clearButton.layer.cornerRadius = 10.0
        }
    }
    
    /// saveButton
    @IBOutlet weak var saveButton: UIButton! {
        
        didSet {
            saveButton.layer.masksToBounds = true
            saveButton.layer.cornerRadius = 10.0
        }
    }
    
    /// addButton
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

