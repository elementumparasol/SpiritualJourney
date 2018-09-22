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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 订阅images
        images.asObservable()
            .subscribe(onNext: { [weak self] (photos) in
                guard let preview = self?.imagePreview else {
                    return
                }
                
                // 将拼贴完成的图片设置到imagePreview控件上面去
                preview.image = UIImage.collage(images: photos, size: preview.frame.size)
            })
            .disposed(by: disposeBag)
    }


}

