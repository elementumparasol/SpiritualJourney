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
    
    
    private let eventsFileURL = cachedFileURL("events.plist")
    private let modifiedFileURL = cachedFileURL("modified.txt")
    private let lastModified = Variable<NSString?>(nil)
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏标题
        title = repo
        
        // 设置刷新控件
        self.refreshControl = UIRefreshControl()
        let refreshControl = self.refreshControl!
        refreshControl.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        refreshControl.tintColor = UIColor.darkGray
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        
        let eventsArray = (NSArray(contentsOf: eventsFileURL) as? [[String: Any]]) ?? []
        events.value = eventsArray.compactMap(Event.init)
        
        lastModified.value = try? NSString(contentsOf: modifiedFileURL, usedEncoding: nil)
        
        
        
        // 程序启动以后，自动获取数据
        refresh()
    }

    
    // MARK: - 自定义方法
    
    /// 下拉刷新(加载新的数据)
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
        
        
        let response = Observable.from([repo])
            .map { urlString -> URL in
                return URL(string: "https://api.github.com/repos/\(urlString)/events")!
            }
            .map { [weak self] url -> URLRequest in
                var request = URLRequest(url: url)
                if let modifiedHeader = self?.lastModified.value {
                    request.addValue(modifiedHeader as String,
                                     forHTTPHeaderField: "Last-Modified")
                }
                return request
            }
            .flatMap { request -> Observable<(response: HTTPURLResponse, data: Data)> in
                return URLSession.shared.rx.response(request: request)
            }
            .share(replay: 1, scope: .whileConnected)
        
        
        
        response
            .filter { response, _ in
                return 200..<300 ~= response.statusCode
            }
            .map { _, data -> [[String: Any]] in
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                    let result = jsonObject as? [[String: Any]] else {
                        return []
                }
                return result
            }
            .filter { objects in
                return objects.count > 0
            }
            .map { objects in
                return objects.compactMap(Event.init)
            }
            .subscribe(onNext: { [weak self] newEvents in
                self?.processEvents(newEvents)
            })
            .disposed(by: disposeBag)
        
        
        
        response
            .filter {response, _ in
                return 200..<400 ~= response.statusCode
            }
            .flatMap { response, _ -> Observable<NSString> in
                guard let value = response.allHeaderFields["Last-Modified"]  as? NSString else {
                    return Observable.empty()
                }
                return Observable.just(value)
            }
            .subscribe(onNext: { [weak self] modifiedHeader in
                guard let strongSelf = self else { return }
                strongSelf.lastModified.value = modifiedHeader
                try? modifiedHeader.write(to: strongSelf.modifiedFileURL, atomically: true,
                                          encoding: String.Encoding.utf8.rawValue)
            })
            .disposed(by: disposeBag)
        
        
        
        
    }
    
    func processEvents(_ newEvents: [Event]) {
        var updatedEvents = newEvents + events.value
        if updatedEvents.count > 50 {
            updatedEvents = Array<Event>(updatedEvents.prefix(upTo: 50))
        }
        
        events.value = updatedEvents
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
        let eventsArray = updatedEvents.map{ $0.dict } as NSArray
        eventsArray.write(to: eventsFileURL, atomically: true)
        
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
