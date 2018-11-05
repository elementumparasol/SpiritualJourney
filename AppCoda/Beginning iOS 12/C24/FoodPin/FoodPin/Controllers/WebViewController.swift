//
//  WebViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/5.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// webView
    @IBOutlet weak var webView: WKWebView!
    
    
    // MARK: - 自定义属性
    
    /// url地址
    var targetURL = ""
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()

        // 关闭大标题
        navigationItem.largeTitleDisplayMode = .never
        
        // 加载网页
        if let url = URL(string: targetURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }

}
