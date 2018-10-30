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
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }


    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 自定义导航条
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar
        .setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar
            .largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(r: 231, g: 76, b: 60)]
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
