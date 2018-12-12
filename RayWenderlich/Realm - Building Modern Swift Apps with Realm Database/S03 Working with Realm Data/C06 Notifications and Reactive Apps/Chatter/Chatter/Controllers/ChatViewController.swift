//
//  ChatViewController.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

class ChatViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 用于存储返回的messages消息
    private var messages: Results<Message>?
    
    /// 用于将日期的字符串样式转换为标准的时间戳格式
    private let formatter = DateFormatter.mediumTimeFormatter
    
    /// 设置新消息cell的背景颜色
    private let highlightColor = UIColor(red: 243/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
    
    /// 用于存储订阅Realm更改时返回的令牌(token)
    private var messageToken: NotificationToken?
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 在当前界面即将出现的时候，创建订阅通知
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 获取默认的Realm实例
        let realm = try! Realm()
        
        // 从数据库中取出所有的Message对象，并且按照创建时间排序
        messages = realm.objects(Message.self)
            .sorted(byKeyPath: Message.Properties.date, ascending: false)
        
        // 订阅messages的更改通知
        messageToken = messages?.observe({ [weak self] (_) in
            
            // 检测到messages发生更改以后，立即刷新tableView
            self?.tableView.reloadData()
        })
    }
    
    // 当用户即将离开当前控制器的时候，立即停止订阅通知
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 如果用户离开当前屏幕，就立即停止订阅messages的更改
        messageToken?.invalidate()
    }

}


// MARK: - UITableViewDataSource
extension ChatViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 根据messages中消息的数量来决定cell的个数
        return messages?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 取出或者创建subtitle样式的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        // 取出从数组messages中取出消息
        let message = messages![indexPath.row]
        
        // 获取消息创建时间
        let formattedDate = formatter.string(from: message.date)
        
        // 设置cell的背景颜色
        cell.contentView.backgroundColor = message.isNew ? highlightColor : .white
        
        // 设置消息发送者
        cell.textLabel?.text = message.isNew ? "[\(message.from)]" : message.from
        
        // 设置消息发送时间和内容
        cell.detailTextLabel?.text = String(format: "(%@) %@", formattedDate, message.text)
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ChatViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 从数组messages中取出当前行的message
        let message = messages![indexPath.row]
        
        // 获取默认的Realm实例
        let realm = try! Realm()
        
        // 在write(_ : )闭包中处理消息的更改
        try! realm.write {
            
            // 消息阅读之后，标记其为非最新消息
            message.isNew = false
        }
    }
}
