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
    
    /// 用于存储选中的图片(创建Observable)
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
        
        // 将图片设置到imageView上面去(订阅Observable)。
        // 我们将订阅时所产生的内存交给disposeBag管理，而disposeBag
        // 是当前控制器的属性，所以理论上讲，当控制器被操作系统回收时，
        // disposeBag也会跟着控制器一起被操作系统回收。但是，当前控制器
        // 是根控制器，也就是说在程序退出之前是一直存在的。那么，这样一来
        // 就会产生一个问题，就是订阅任务完成以后，disposeBag并不会被及
        // 时回收，因此就会产生内存泄漏问题。为了解决这个矛盾，在闭包中捕获
        // 当前控制器时，使用[weak self]
        images.asObservable().subscribe(onNext: { [weak self] photos in
            
            // 对imageView控件进行校验
            guard let imageView = self?.imageView else { return }
            
            // 将选中的图片设置到imageView上面
            imageView.image = UIImage
                .collage(images: photos, size: imageView.frame.size)
        }).disposed(by: disposeBag)
        
        // 设置UI界面(开始新的订阅)
        images.asObservable().subscribe(onNext: { [weak self] (photos) in
            self?.updateUI(photos: photos)
        }).disposed(by: disposeBag)
    }

    
    // MARK: - @IBAction
    
    /// 点击导航栏右边按钮添加照片
    @IBAction func addPhotos(_ sender: Any) {
        
        // 将图片添加到数组images中(通过value来添加.next事件)
//        images.value.append(UIImage(named: "吸猫.jpg")!)
        
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
        
        // 选中图片，并且将其添加到数组images中
        photosViewController.selectedPhotos.subscribe(onNext: { [weak self] (image) in
            
            // 对数组images进行校验
            guard let images = self?.images else { return }
            
            // 将选中的图片添加到数组images中
            images.value.append(image)
            
        }, onDisposed: {
            print("Completed photo selection.")
        }).disposed(by: disposeBag)
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
    
    /// 设置UI界面
    ///
    /// - Parameter photos: 从相册中选中的图片
    private func updateUI(photos: [UIImage]) {
        
        // 照片的数量要大于0，并且必须是偶数
        saveButton.isEnabled = photos
            .count > 0 && photos.count % 2 == 0
        
        // 照片的数量必须大于0
        clearButton.isEnabled = photos.count > 0
        
        // 最多只能添加6张照片
        addButton.isEnabled = photos.count < 6
        
        // 照片的数量大于0时，修改导航栏标题
        title = photos
            .count > 0 ? "\(photos.count) photos" : "Collage"
    }
}

