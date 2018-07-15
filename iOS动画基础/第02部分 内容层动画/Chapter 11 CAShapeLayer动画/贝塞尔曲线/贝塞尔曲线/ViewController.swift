//
//  ViewController.swift
//  贝塞尔曲线
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性
    
    /// drawView
    private lazy var drawView: DrawView = {
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        let view = DrawView(frame: CGRect(origin: .zero, size: CGSize(width: screenWidth - 40, height: screenHeight - 40)))
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 确定drawView控件的位置
        drawView.center = view.center
        
        // 将drawView添加到当前控制器的view上
        view.addSubview(drawView)
    }
}

