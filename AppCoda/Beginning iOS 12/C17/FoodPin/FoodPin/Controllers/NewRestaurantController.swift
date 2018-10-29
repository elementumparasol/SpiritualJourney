//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/29.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class NewRestaurantController: UITableViewController {
    
    // MARK: - @IBOutlet
    
    /// nameTextField
    @IBOutlet weak var nameTextField: UITextField! {
        
        didSet {
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    
    /// typeTextField
    @IBOutlet weak var typeTextField: UITextField! {
        
        didSet {
            typeTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    
    /// addressTextField
    @IBOutlet weak var addressTextField: UITextField! {
        
        didSet {
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    
    /// phoneTextField
    @IBOutlet weak var phoneTextField: UITextField! {
        
        didSet {
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }
    
    /// descriptionTextView
    @IBOutlet weak var descriptionTextView: UITextView! {
        
        didSet {
            descriptionTextView.tag = 5
            descriptionTextView.layer.cornerRadius = 5.0
            descriptionTextView.layer.masksToBounds = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    
}


// MARK: - UITextFieldDelegate
extension NewRestaurantController: UITextFieldDelegate {
    
    // 用户点击回车键时会被调用
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        
        return true
    }
}
