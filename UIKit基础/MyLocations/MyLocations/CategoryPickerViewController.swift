//
//  CategoryPickerViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class CategoryPickerViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 选择分类名称
    var selectedCategoryName = ""
    
    /// 存放分类名称的数组
    let categories = [
        "暂无分类",
        "Apple Store",
        "酒吧",
        "书店",
        "夜总会",
        "杂货店",
        "古建筑",
        "家",
        "冰激凌小卖部",
        "地标",
        "公园"]
    
    /// 被选中cell的indexPath
    var selectedIndexPath = IndexPath()
    
    
    
    
    // MARK: - 类自带的方法
    
    /// 控制器view加载完毕之后调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 遍历数组categories
        for i in 0..<categories.count {
            if categories[i] == selectedCategoryName {
                
                // 根据索引i创建一个指向特定分组中某一行的indexPath，
                // 并且将其存储到selectedIndexPath属性中
                selectedIndexPath = IndexPath(row: i, section: 0)
                break
            }
        }
    }
    
    /// 执行segue的时候调用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PickedCategory" {
            
            let cell = sender as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                
                // 给selectedCategoryName设置数据
                selectedCategoryName = categories[indexPath.row]
            }
        }
    }
    
    
    
    
    
}



// MARK: - UITableViewDataSource
extension CategoryPickerViewController {
    
    // 返回分组中cell的个数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    // 返回cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 根据标识符去缓存池中取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // 从数组categories中取出对应的名称
        let categoryName = categories[indexPath.row]
        
        // 设置cell的textLabel上面的文字
        cell.textLabel!.text = categoryName
        
        // 设置accessoryType的样式
        if categoryName == selectedCategoryName {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
    
    
    
    
}



// MARK: - UITableViewDelegate
extension CategoryPickerViewController {
    
    // 告诉代理某一行现在被选中
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row != selectedIndexPath.row {
            
            if let newCell = tableView.cellForRow(at: indexPath) {
                newCell.accessoryType = .checkmark
            }
            
            if let oldCell = tableView.cellForRow(at: selectedIndexPath) {
                oldCell.accessoryType = .none
            }
            
            selectedIndexPath = indexPath
        }
        
    }
    
    
    
    
    
    
}
