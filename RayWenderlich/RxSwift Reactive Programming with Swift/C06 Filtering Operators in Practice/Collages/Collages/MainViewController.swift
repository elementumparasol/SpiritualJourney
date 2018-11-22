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
    
    /// 将图片的字节长度存储到数组中，以方便后续查找对应的图片
    private var imageCache = [Int]()
    
    
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
        let newPhotos = photosViewController.selectedPhotos.share()
        newPhotos
            .filter({ newImage in
            return newImage.size.width > newImage.size.height
        })  // 只需要宽度大于高度的图片，将宽度小于高度的图片过滤掉
            .filter({ [weak self] newImage in
                
                // 以PNG格式返回指定图片的数据，然后在求它的长度
                let length = newImage.pngData()?.count ?? 0
                
                // 如果imageCache中包含相同的长度值，则说明数组中
                // 已经添加过该图片，通过返回false将重复的图片丢弃
                guard self?.imageCache.contains(length) == false else {
                    return false
                }
                
                // 将图片的长度存储到数组imageCache中
                self?.imageCache.append(length)
                
                return true
            })  // 同一张图片只能添加一次，多次添加的会被过滤掉
            .subscribe(onNext: { [weak self] (image) in
            
            // 对数组images进行校验
            guard let images = self?.images else { return }
            
            // 将选中的图片添加到数组images中
            images.value.append(image)
            
        }, onDisposed: {
            print("Completed photo selection.")
        }).disposed(by: disposeBag)
        
        // 设置导航栏左边的item。因为只需要显示最终的结果
        // 而选择图片的过程可以忽略，因此使用ignoreElements进行过滤
        newPhotos.ignoreElements()
            .subscribe(onCompleted: { [weak self] in
            
                // 设置导航栏的leftBarButtonItem
                self?.updateNavigationIcon()
        }).disposed(by: disposeBag)
    }
    
    /// 点击clear按钮，情况照片
    @IBAction func clearButtonTapClick() {
        
        // 清空图片数组images
        images.value = []
        imageCache = []
    }
    
    /// 点击save按钮保存照片
    @IBAction func saveButtonClick(_ sender: Any) {
        
        // 对图片进行校验
        guard let image = imageView.image else { return }
        
        // 将图片保存到系统相册(订阅Observable)。在订阅Observable
        // 的时候，可以通过.asSingle()方法来将任何Observable转换
        // 为Single。但是，有一点需要记住，不能将Observable可观察序
        // 列转换为Completable
        PhotoWriter.save(image).asSingle().subscribe(onSuccess: { [weak self] (id) in
            
            // 弹出保存成功的消息提示
            self?.showMessage("Successfully saved!")
            
            // 图片保存成功以后清空图片
            self?.clearButtonTapClick()
            }, onError: { [weak self] (error) in
                
                // 弹出错误消息
                self?.showMessage("Error", message: error.localizedDescription)
        }).disposed(by: disposeBag)
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
    
    /// 显示一个Alert弹窗信息
    ///
    /// - Parameters:
    ///   - title: 弹窗标题
    ///   - message: 弹窗描述信息
    private func showMessage(_ title: String, message: String?=nil) {
        
        // 创建alertController
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // 创建alertAction
        let alertAction = UIAlertAction(title: "Close", style: .default) { [weak self] (_) in
            
            self?.dismiss(animated: true, completion: nil)
        }
        
        // 将alertAction添加到alertController中
        alertController.addAction(alertAction)
        
        // 弹出alertController
        present(alertController, animated: true, completion: nil)
    }
    
    /// 设置导航栏的leftBarButtonItem
    private func updateNavigationIcon() {
        
        // 提取imageView中的图片
        let icon = imageView.image?.scaled(CGSize(width: 22, height: 22)).withRenderingMode(.alwaysOriginal)
        
        // 将icon设置到导航栏左边的item中
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: icon, style: .done, target: nil, action: nil)
    }
}

