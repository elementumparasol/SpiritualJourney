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
    
    /// photoImageView
    @IBOutlet weak var photoImageView: UIImageView!
    
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
        
        // 去掉分割线
        tableView.separatorStyle = .none
        
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
                    
                    // 设置imagePicker的代理
                    imagePicker.delegate = self
                    
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
                    imagePicker.delegate = self
                    
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


// MARK: - UIImagePickerController, UINavigationController
extension NewRestaurantController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 用户从相册中选择照片或者图片时调用
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        /**
         * 1、从相册中选择照片
         */
        
        // 获取用户从相册中选中的照片
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage]
            as? UIImage {
            
            // 将照片设置到photoImageView控件上去
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        /**
         * 2、设置照片的NSLayoutConstraint约束
         */
        
        // 左边约束
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        // 右边约束
        let trailingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        // 顶部约束
        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        // 底部约束
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        
        /**
         * 3、照片选择完毕，退出照片库控制器
         */
        
        // 照片选择完毕，退出控制器
        dismiss(animated: true, completion: nil)
    }
}
