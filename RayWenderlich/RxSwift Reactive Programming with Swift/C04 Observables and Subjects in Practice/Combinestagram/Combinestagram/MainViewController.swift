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
        
        images.value.append(UIImage(named: "IMG_1907")!)
    }
    
    /// 点击清除按钮调用
    @IBAction func actionClear(_ sender: Any) {
        
        images.value = []
    }
    
    /// 点击保存按钮调用
    @IBAction func actionSave(_ sender: Any) {
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
        title = photos.count > 0 ? "\(photos.count) photoes" : "Collage"
    }


}

