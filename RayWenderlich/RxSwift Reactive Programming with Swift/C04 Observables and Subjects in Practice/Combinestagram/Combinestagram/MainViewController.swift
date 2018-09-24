//
//  ViewController.swift
//  Combinestagram
//
//  Created by Enrica on 2018/9/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    // MARK: - 自定义属性
    
    /// disposeBag，用于管理订阅内存
    private let disposeBag = DisposeBag()
    
    /// images数组(observable)
    private let images = Variable<[UIImage]>([])
    
    
    // MARK: - @IBOutlet
    
    /// 添加按钮
    @IBOutlet weak var itemAdd: UIBarButtonItem!
    
    /// 展示图片的控件
    @IBOutlet weak var imagePreview: UIImageView!
    
    /// 清除按钮
    @IBOutlet weak var buttonClear: UIButton!
    
    /// 保存按钮
    @IBOutlet weak var buttonSave: UIButton!
    
    
    // MARK: - @IBAction
    
    /// 点击导航栏右边的加号按钮调用
    @IBAction func actionAdd(_ sender: Any) {
        
        // images.value.append(UIImage(named: "IMG_1907")!)
        
        // 从storyboard初始化PhotosViewController控制器
        let photosViewController = storyboard?.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
        
        // 订阅selectedPhotos
        photosViewController.selectedPhotos
            .subscribe(onNext: { [weak self] (newImage) in
                
                // 对图片数组images进行校验
                guard let images = self?.images else { return }
                
                // 将newImage添加到数组images中
                images.value.append(newImage)
                }, onDisposed: {
                    
                    // 订阅完成，释放内存时调用
                    print("图片选择完成!")
            })
            .disposed(by: disposeBag)
        
        // push到PhotosViewController控制器
        navigationController!.pushViewController(photosViewController, animated: true)
    }
    
    /// 点击清除按钮调用
    @IBAction func actionClear(_ sender: Any) {
        
        images.value = []
    }
    
    /// 点击保存按钮调用
    @IBAction func actionSave(_ sender: Any) {
        
        // 校验图片是否存在
        guard let image = imagePreview.image else { return }
        
        // 将图片保存到相册
        PhotoWriter.save(image)
        .asSingle()
            .subscribe(onSuccess: { [weak self] (id) in
                self?.showMessage("已保存id为: \(id)")
                self?.actionClear(sender)
            }) { [weak self] (error) in
                self?.showMessage("Error", description: error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }
    
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 订阅images，用于设置图片
        images.asObservable()
            .subscribe(onNext: { [weak self] (photos) in
                guard let preview = self?.imagePreview else {
                    return
                }
                
                // 将拼贴完成的图片设置到imagePreview控件上面去
                preview.image = UIImage.collage(images: photos, size: preview.frame.size)
            })
            .disposed(by: disposeBag)
        
        // 再次添加一个订阅，用于更新其它UI界面
        images.asObservable()
            .subscribe(onNext: { [weak self] (photos) in
                
                // 更新UI界面(设置相关的按钮和导航栏标题)
                self?.updateUI(photos: photos)
            })
            .disposed(by: disposeBag)
    }
    
    
    // MARK: - 自定义的方法
    
    /// 用于更新UI界面
    private func updateUI(photos: [UIImage]) {
        
        // 数组photos中有照片，并且照片的数量为偶数时，buttonSave按钮才能被点击
        buttonSave.isEnabled = photos.count > 0 && photos.count % 2 == 0
        
        // 如果照片的数量大于0，则buttonClear才能被点击
        buttonClear.isEnabled = photos.count > 0
        
        // 最多只能添加6张照片
        itemAdd.isEnabled = photos.count < 6
        
        // 设置导航栏标题
        title = photos.count > 0 ? "\(photos.count)张图片" : "Collage"
    }
    
    /// 显示提示信息
    func showMessage(_ title: String, description: String?=nil) {
        
        // 床架alert控制器
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        // 创建alertAction
        let action = UIAlertAction(title: "关闭", style: .default) { [weak self] (_) in
            self?.dismiss(animated: true, completion: nil)
        }
        
        // 将action添加到alert控制器
        alert.addAction(action)
        
        // present到alert控制器
        present(alert, animated: true, completion: nil)
    }

}

