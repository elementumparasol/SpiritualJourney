//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    // MARK: - 实例变量
    
    /// Checklist类型的属性
    var checklist: Checklist!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 取消大标题
        navigationItem.largeTitleDisplayMode = .never
        
        // 设置导航栏标题
        title = checklist.name
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return checklist.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistsItem", for: indexPath)
        
        // 取出模型
        let item = checklist.items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)

        return cell
    }
    
    
    // MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 从模型数组中删除模型数据
        checklist.items.remove(at: indexPath.row)
        
        // 从tableView中删除相关的行
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    /// 处理cell的点击
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = checklist.items[indexPath.row]
            
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /// 设置checkmark
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.textColor = view.tintColor
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    /// 设置cell的Label的Text
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    // MARK: - 设置ChecklistViewController成为ItemDetailViewController的代理
    
    /// 告诉ItemDetailViewController，ChecklistViewController成为它的代理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem" {
            
            // 根据segue的标识符取出ItemDetailViewController
            let controller = segue.destination as! ItemDetailViewController
            
            // 让当前控制器成为ItemDetailViewController的代理
            controller.delegate = self
        }else if segue.identifier == "EditItem" {
            
            let controller = segue.destination as! ItemDetailViewController
            
            controller.delegate = self
            
            // 编辑之前的item
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }

}


// MARK: - ItemDetailViewControllerDelegate
extension ChecklistViewController: ItemDetailViewControllerDelegate {
    
    /// 取消添加或者修改item
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    
    /// 添加item
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        
        // 创建新的item
        let newRowIndex = checklist.items.count
        checklist.items.append(item)
        
        // 将新创建的item插入到tableView中
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }

    
    /// 完成item的修改
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        
        // 一个对象只有在遵守Equatable协议之后，我们才能使用firstIndex(of: )
        // 方法。所以，我们可以让ChecklistItem继承自NSObject。因为NSObject
        // 是遵守Equatable协议的
        if let index = checklist.items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
            
        }
        navigationController?.popViewController(animated: true)
    }
}
