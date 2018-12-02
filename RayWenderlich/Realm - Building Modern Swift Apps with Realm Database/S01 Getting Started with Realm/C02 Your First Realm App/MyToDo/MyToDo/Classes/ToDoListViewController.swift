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
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 从Realm中取出所有持久化的数据，并且将其存储到items中
        items = ToDoItem.all()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
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
            
            //
        }
        
        return cell
    }
    
    // 询问数据源，指定行的内容是否可以编辑
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let item = items?[indexPath.row], editingStyle == .delete else {
            return 
        }
    }
}


// MARK: - UITableViewDelegate
extension ToDoListViewController {
    
    
}
