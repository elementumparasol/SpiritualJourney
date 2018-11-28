//
//  ViewController.swift
//  Github
//
//  Created by Enrica on 2018/11/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class ViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 导航栏标题(也是GitHub仓库名称)
    private let repo = "ReactiveX/RxSwift"
    
    /// 数据模型
    private let events = Variable<[Event]>([])
    
    /// 用于内存管理
    private let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏标题
        title = repo
        
        
    }
    
    
    // MARK: - 自定义方法
    
    /// 获取网络数据
    ///
    /// - Parameter repo: GitHub仓库名称
    func fetchEvents(repo: String) {
        
        // 创建Observable实例
        let response = Observable
            .from([repo])  // from方法接收一个数组参数来创建Observable实例
            .map { (repo) -> URL in  // 拼接URL字符串
                return URL(string: "https://api.github.com/repos/\(repo)/events")!
            }
            .map { (url) -> URLRequest in  // 将URL地址转换为URLRequest
                return URLRequest(url: url)
            }
            // 使用RxCocoa的response(request: )方法。当该方法完成时
            // 我们会从服务器上收到一个完整的相应，并且，该方法会返回一个
            // Observable<(response: HTTPURLResponse, data: Data)>
            .flatMap { (request) -> Observable<(response: HTTPURLResponse, data: Data)> in
                
                // 发送网络请求
                return URLSession.shared.rx.response(request: request)
        }.share(replay: 1, scope: .whileConnected)
        
        // 过滤出所有成功的代码(也就是范围在200和300之间的状态码)，
        // 然后让其通过
        
        // ~=运算符与左侧的范围一起使用时，用于检测该范围是否
        // 包含该运算符右侧的值
        
        
        
    }
    
    
    

    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row) --- text"
        
        return cell
    }

}

