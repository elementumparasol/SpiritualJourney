//
//  ToDoListViewController.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/2.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 用于存储从Realm中获取的结果
    private var items: Results<ToDoItem>?
    
    /// 监听Realm更改通知
    private var itemsToken: NotificationToken?
    
    // MARK: - 类自带的方法

    // 控制器view加载到内存以后调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 从Realm中取出所有持久化的数据，并且将其存储到items中
        items = ToDoItem.all()
    }

    // 通知控制器，view即将添加到视图层次结构中(监听Realm的改变)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 监听Realm的更改(每次有改变时，Realm都会调用这个闭包)
        itemsToken = items?.observe({ [weak tableView] (changes) in
            
            guard let tableView = tableView else { return }
            
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let updates):
                tableView.applyChanges(deletions: deletions, insertions: insertions, updates: updates)
            case .error:
                break
            }
        })
    }
    
    // 通知控制器，view已从视图层次结构中删除(停止监听Realm的改变)
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 停止监听Realm改变的通知
        itemsToken?.invalidate()
    }
    
    
    // MARK: - @IBAction
    
    /// 添加新的待办事项
    @IBAction func addItem(_ sender: Any) {
        
        userInputAlert("Add Todo Item") { (text) in
            ToDoItem.add(text: text)
        }
    }
    
    
    // MARK: - 自定义方法
    
    /// 切换待办事项的当前状态
    ///
    /// - Parameter item: 待办事项
    func toggleItem(_ item: ToDoItem) {
        
        item.toggleCompleted()
    }
    
    /// 删除待办事项
    ///
    /// - Parameter item: 待办事项
    func deleteItem(_ item: ToDoItem) {
        
        item.delete()
    }
}


// MARK: - UITableViewDataSource
extension ToDoListViewController {
    
    // 返回tableView中的分组数(如果不实现，默认为一组)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 返回tableView中分组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items?.count ?? 0
    }
    
    // 返回tableView中的cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ToDoTableViewCell,
                let item = items?[indexPath.row] else {
            return ToDoTableViewCell(frame: .zero)
        }
        
        cell.configureWith(item) { [weak self] (item) in
            
            self?.toggleItem(item)
        }
        
        return cell
    }
    
    // 询问数据源，指定行的内容是否可以编辑
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 编辑选中的cell(实现插入或删除cell等操作)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let item = items?[indexPath.row], editingStyle == .delete else {
            return 
        }
        
        deleteItem(item)
    }
}


// MARK: - UITableViewDelegate
extension ToDoListViewController {
    
    
}
