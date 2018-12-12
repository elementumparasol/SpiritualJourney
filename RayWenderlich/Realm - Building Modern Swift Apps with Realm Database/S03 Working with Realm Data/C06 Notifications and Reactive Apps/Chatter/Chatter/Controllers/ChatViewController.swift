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
        
        // 订阅messages的更改通知。当tableView中的cell发生更改
        // 时，Realm数据库中的数据也相应的要进行处理，主要是删除数据
        messageToken = messages?.observe({ [weak tableView] (changes) in
            
            // 检测到messages发生更改以后，立即刷新tableView
            // self?.tableView.reloadData()
            
            guard let tableView = tableView else { return }
            
            switch changes {
                
            // 表示初始化已经完成，集合changes在不执行任何操作就可以使用了
            case .initial:
                
                // 刷新tableView
                tableView.reloadData()
                
            // 表示集合changes发生任何更改就会来到这里
            case .update(_, let deletions, let insertions, let modifications):
                
                // 删除tableView中的数据时，也要同步删除存储在数据库中的数据
                tableView.applyChanges(deletions: deletions, insertions: insertions, updates: modifications)
              
            // 集合changes因发生更改而产生错误时就会来到这里
            case .error:
                break
            }
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
    
    // 选中当前行之后，将本条消息标记为已读
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 取消cell被选中时的高亮状态
        tableView.deselectRow(at: indexPath, animated: false)
        
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
    
    // 允许对当前行进行编辑
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 允许删除消息
        guard editingStyle == .delete else { return }
        
        // 从数据库中取出当前行的message
        let message = messages![indexPath.row]
        
        // 获取默认的Realm实例
        let realm = try! Realm()
        
        // 在write(_ : )中删除出当前上的message
        try! realm.write {
            realm.delete(message)
        }
    }
}
