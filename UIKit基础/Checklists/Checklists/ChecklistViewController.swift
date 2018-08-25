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
    
    /// 声明模型数组
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        // 初始化模型数组
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text = "遛狗"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "刷牙"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "学习iOS编程"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "踢足球"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "吃冰激凌"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏大标题
        // navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    /// 1、创建新的模型数据
    /// 2、将新的模型数据添加到模型数组中
    /// 3、将新的模型数据显示到tableView上面
    @IBAction func addItem() {
        
        // 获取模型的个数
        let newRowIndex = items.count
        
        // 创建新的模型
        let item = ChecklistItem()
        item.text = "新的一行"
        item.checked = false
        items.append(item)
        
        // 创建IndexPath
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        
        // 创建indexPath数组
        let indexPaths = [indexPath]
        
        // 将indexPath插入到数组中
        tableView.insertRows(at: indexPaths, with: .automatic)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistsItem", for: indexPath)
        
        // 取出模型
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)

        return cell
    }
    
    
    // MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 从模型数组中删除模型数据
        items.remove(at: indexPath.row)
        
        // 从tableView中删除相关的行
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    /// 处理cell的点击
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /// 设置checkmark
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    /// 设置cell的Label的Text
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}
