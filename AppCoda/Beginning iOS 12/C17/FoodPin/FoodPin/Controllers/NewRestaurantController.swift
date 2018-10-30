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


// MARK: - UITableViewDelegate
extension NewRestaurantController {
    
    // 点击某一行cell的时候调用
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 如果用户选择第0行cell，则执行下面的操作
        if indexPath.row == 0 {
            
            // 创建UIAlertController控制器
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
            
            // 相机action
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                
                // 通过isSourceTypeAvailable方法判断相机是否可用
                if UIImagePickerController
                    .isSourceTypeAvailable(.camera) {
                    
                    // 创建UIImagePickerController实例
                    let imagePicker = UIImagePickerController()
                    
                    // 禁用编辑
                    imagePicker.allowsEditing = false
                    
                    // 设置从相机中获取图片
                    imagePicker.sourceType = .camera
                    
                    // 弹出相机
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            
            // 相册action
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default) { (action) in
                
                // 判断相册是否可用
                if UIImagePickerController
                    .isSourceTypeAvailable(.photoLibrary) {
                    
                    // 如果相册可用，则创建UIImagePickerController实例
                    let imagePicker = UIImagePickerController()
                    imagePicker.isEditing = false
                    imagePicker.sourceType = .photoLibrary
                    
                    // 弹出相册选择控制器
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            
            // 取消操作action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            // 将action添加到alertController中
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            photoSourceRequestController.addAction(cancelAction)
            
            // 适配iPad屏幕
            if let popoverController = photoSourceRequestController
                .popoverPresentationController {
                
                // 获取cell
                if let cell = tableView.cellForRow(at: indexPath) {
                    
                    // 设置popoverController的sourceView和sourceRect
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            // 弹出UIAlertController控制器
            present(photoSourceRequestController, animated: true, completion: nil)
        }
        
        
        
        
        
    }
    
    
    
}
