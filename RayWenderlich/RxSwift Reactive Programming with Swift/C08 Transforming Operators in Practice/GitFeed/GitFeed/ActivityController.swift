//
//  ActivityController.swift
//  GitFeed
//
//  Created by Enrica on 2018/9/28.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class ActivityController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 导航栏标题
    private let repo = "ReactiveX/RxSwift"
    
    /// event模型
    private let events = Variable<[Event]>([])
    
    /// 用于管理资源的释放
    private let disposeBag = DisposeBag()
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏标题
        title = repo
        
        // 设置刷新控件
        self.refreshControl = UIRefreshControl()
        let refreshControl = self.refreshControl!
        refreshControl.backgroundColor = UIColor(white: 0.98, alpha: 1)
        refreshControl.tintColor = .darkGray
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        refresh()
    }

    
    // MARK: - 自定义方法
    
    /// 下拉刷新
    @objc func refresh() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            // 对self进行校验
            guard let strongSelf = self else { return }
            
            // 获取数据
            strongSelf.fetchEvents(repo: strongSelf.repo)
        }
    }
    
    /// 获取数据
    func fetchEvents(repo: String) {
        
        //
    }

}


// MARK: - UITableViewDataSource
extension ActivityController {
    
    // 返回Section中cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.value.count
    }
    
    // 返回UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 取出对应的event
        let event = events.value[indexPath.row]
        
        // 给cell设置数据
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = event.repo + ", " + event.action.replacingOccurrences(of: "Event", with: "").lowercased()
        cell.imageView?.kf.setImage(with: event.imageUrl, placeholder: UIImage(named: "blank-avatar"))
        
        
        return cell
    }
}
