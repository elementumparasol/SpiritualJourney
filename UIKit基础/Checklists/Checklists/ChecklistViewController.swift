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
    
    /// 声明并初始化模型数组
    var items = [ChecklistItem]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏大标题
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 从plist文件中加载数据
        loadChecklistItems()
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
        
        // 保存修改
        saveChecklistItems()
    }
    
    /// 处理cell的点击
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 保存修改
        saveChecklistItems()
    }
    
    /// 设置checkmark
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1001) as! UILabel
        
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
                controller.itemToEdit = items[indexPath.row]
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
        let newRowIndex = items.count
        items.append(item)
        
        // 将新创建的item插入到tableView中
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        // 保存数据
        saveChecklistItems()
        
        navigationController?.popViewController(animated: true)
    }

    
    /// 完成item的修改
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        
        // 一个对象只有在遵守Equatable协议之后，我们才能使用firstIndex(of: )
        // 方法。所以，我们可以让ChecklistItem继承自NSObject。因为NSObject
        // 是遵守Equatable协议的
        if let index = items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
            
            // 保存数据
            saveChecklistItems()
        }
        navigationController?.popViewController(animated: true)
    }
}


// MARK: - 获取沙盒中的Documents文件夹
extension ChecklistViewController {
    
    /// 获取Documents文件夹路径
    func documentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    /// 创建plist文件的路径
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
}


// MARK: - 沙盒数据的读取和写入
extension ChecklistViewController {
    
    /// 将数据写入到沙盒中Documents目录下的.plist文件中
    func saveChecklistItems() {
        
        // 创建PropertyListEncoder实例
        let encoder = PropertyListEncoder()
        
        // 处理错误(对会抛出异常的方法进行处理)
        do {
            
            // encode方法在无法对目标进行编码时，会抛出异常
            // 所以需要用do-catch对其进行处理
            let data = try encoder.encode(items)  // Encodable协议
            
            // 如果encode方法执行成功，就将数据些人到目标文件(即Checklists.plist)
            // 因为write(to: options:)方法也会抛出异常，所以这里也要进行异常处理
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            
            // encode方法执行失败时，会进入到catch分支
            print("对items数组进行编码时发生错误!")
        }
    }
    
    /**
     对会抛出异常的方法进行异常处理，有两种常见的方式:
     - (1)、使用try?
     - (2)、在do-catch代码块中使用try
     */
    
    
    /// 读取沙盒中Documents文件夹里面的plist数据
    func loadChecklistItems() {
        
        // 获取Checklist.plist文件的路径
        let path = dataFilePath()
        
        // 读取Checklist.plist文件中的数据，并且将其转换成Data数据
        if let data = try? Data(contentsOf: path) {
            
            // 创建PropertyListDecoder实例
            let decoder = PropertyListDecoder()
            
            // 对decode方法进行异常处理
            do {
                
                // 对items进行解码
                items = try decoder.decode([ChecklistItem].self, from: data)
            } catch {
                
                // 如果decode方法执行失败，则进入到catch分支里面执行print()
                print("对items数组进行解码时发生错误!")
            }
        }
    }
}
