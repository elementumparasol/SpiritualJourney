//
//  MainViewController.swift
//  Collages
//
//  Created by Enrica on 2018/11/13.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// 用于Observable和Subject的内存管理
    /// 因为所有的Observable都是交给disposeBag
    /// 来管理的，而disposeBag又是当前控制器的属
    /// 性，因此，只要当前控制器被释放了，那么所有
    /// 的Observable也将被一起释放
    private let disposeBag = DisposeBag()
    
    /// 用于存储选中的图片
    private let images = Variable<[UIImage]>([])
    
    
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
            clearButton.layer.cornerRadius = clearButton
                .bounds.size.width * 0.5
        }
    }
    
    /// saveButton
    @IBOutlet weak var saveButton: UIButton! {
        
        didSet {
            saveButton.layer.masksToBounds = true
            saveButton.layer.cornerRadius = saveButton
                .bounds.size.width * 0.5
        }
    }
    
    /// addButton
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 订阅数组images
        images.asObservable().subscribe(onNext: { [weak self] photos in
            
            // 对imageView控件进行校验
            guard let imageView = self?.imageView else { return }
            
            // 将选中的图片设置到imageView上面
            imageView.image = UIImage
                .collage(images: photos, size: imageView.frame.size)
        }).disposed(by: disposeBag)
    }

    
    // MARK: - @IBAction
    
    /// 点击导航栏右边按钮添加照片
    @IBAction func addPhotos(_ sender: Any) {
        
        // 将图片添加到数组images中
        images.value.append(UIImage(named: "吸猫.jpg")!)
        
        // 获取storyboardId，用于加载指定的storyboard
        // 因为我们的storyboardId设置为类名相同，因此只需
        // 要获取类名字符串就可以了。不过，在Swift里面获取
        // 到的类名字符串是"命名空间.类名字符串"的形式，因此
        // 这里需要对获取到的字符串做一些特殊处理
        guard let identifier = NSStringFromClass(PhotosCollectionViewController.self)
            .components(separatedBy: ".").last else { return }
        
        // 通过storyboardId来初始化指定的控制器
        let photosViewController = storyboard?.instantiateViewController(withIdentifier: identifier) as! PhotosCollectionViewController
        
        // push到指定的控制器
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    /// 点击clear按钮，情况照片
    @IBAction func clearButtonTapClick(_ sender: Any) {
        
        // 清空图片数组images
        images.value = []
    }
    
    /// 点击save按钮保存照片
    @IBAction func saveButtonClick(_ sender: Any) {
        
        print("点击Save按钮保存照片")
    }
    
    
    // MARK: - 自定义方法

}

