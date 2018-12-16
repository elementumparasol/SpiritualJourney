//
//  ToDoListController.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 用于存储从Realm数据库中取回的所有ToDoItem对象
    private var items: Results<ToDoItem>?
    
    /// 用于存储订阅items更改通知时返回的令牌(token)
    private var itemsToken: NotificationToken?
    
    
    // MARK: - @IBAction
    
    /// 点击导航栏左边的加密按钮进行数据加密
    @IBAction func encryptRealm() {
        
        showSetPassword()
    }
    
    /// 点击导航栏右边的加号按钮添加新的ToDo清单
    @IBAction func addItem() {
        
        // 以alert的形式弹出一个用户输入框
        userInputAlert("Add ToDo item") { (text) in
            ToDoItem.add(text: text)
        }
    }
    
    
    // MARK: - 类自带的方法

    // 当前控制器的view加载到内存中的时候调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tableView的行高
        tableView.rowHeight = 44
        
        // 从Realm数据库中取出所有的ToDoItem数据
        items = ToDoItem.all()
    }
    
    // 当前控制器的view即将显示的时候调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 监听items中数据的改变，并且保存itemsToken
        itemsToken = items!.observe({ [weak tableView] (changes) in
            
            guard let tableView = tableView else { return }
            
            // 对监听结果进行处理
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                tableView.applyChanges(deletions: deletions, insertions: insertions, modifications: modifications)
            case .error:
                break
            }
        })
    }
    
    // 当前控制器的view即将消失的时候调用
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 取消对items的监听
        itemsToken?.invalidate()
    }
    
    
    // MARK: - 自定义方法
    
    /// 对当前所选中的cell进行标记
    ///
    /// - Parameter item: 当前cell的item数据
    func toggleItem(_ item: ToDoItem) {
        
        // 对当前的item进行标记
        item.toggleCompleted()
    }
    
    /// 删除当前所选中的cell
    ///
    /// - Parameter item: 当前选中cell的item数据
    func deleteItem(_ item: ToDoItem) {
        item.delete()
    }

    /// 显示加密控制器
    func showSetPassword() {
        
        // 根据指定的标识符加载SetupViewController控制器
        let setupController = storyboard!.instantiateViewController(withIdentifier: "SetupViewController") as! SetupViewController
        
        // 设置密码
        setupController.isSetPassword = true
        
        // 添加控制器转场动画
        UIView.transition(with: view.window!, duration: 0.33, options: .transitionFlipFromRight, animations: {
            
            // 设置当前窗口的根控制器为setupController
            self.view.window?.rootViewController = setupController
        }, completion: nil)
    }
}


// MARK: - UITableViewDataSource
extension ToDoListController {
    
    // 返回tableView中cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    // 返回tableView中当前行的cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoTableViewCell
        
        // 从数组items中取出当前行的item
        if let item = items?[indexPath.row] {
            
            // 给cell设置数据
            cell.updateCell(with: item)
            
            // 对当前的清单item进行标记
            cell.didToggleCompleted = { [weak self] in
                self?.toggleItem(item)
            }
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ToDoListController {
    
    // 允许对当前所选中的cell进行编辑
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 对当前所选中的cell进行编辑
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 取消当前cell被选中时的高亮状态
        tableView.deselectRow(at: indexPath, animated: false)
        
        // 让当前cell的编辑模式为delete
        guard editingStyle == .delete else { return }
        
        // 取出当前行的cell，并且删除
        if let item = items?[indexPath.row] {
            
            // 删除当前选中的cell
            deleteItem(item)
        }
    }
}
