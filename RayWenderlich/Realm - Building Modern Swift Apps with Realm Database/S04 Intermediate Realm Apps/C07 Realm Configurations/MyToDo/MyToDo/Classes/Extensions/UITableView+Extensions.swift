//
//  UITableView+Extensions.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension IndexPath {
    
    /// 将tableView中指定cell的索引转换为IndexPath
    ///
    /// - Parameter row: tableView中cell的索引
    /// - Returns: 返回该索引的IndexPath
    static func fromRow(_ row: Int) -> IndexPath {
        return IndexPath(row: row, section: 0)
    }
}

extension UITableView {
    
    /// 根据指定的索引位置修改tableView中的cell
    ///
    /// - Parameters:
    ///   - deletions: tableView中被删除cell的索引
    ///   - insertions: tableView中需要插入新的元素的索引位置
    ///   - modifications: tableView中需要重新加载数据的cell的索引
    func applyChanges(deletions: [Int], insertions: [Int], modifications: [Int]) {
        
        // 开始一系列方法的调用，比如说删除、插入或者选中tableView中的行
        beginUpdates()
        
        // 删除tableView中选中的行，并且执行动画
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        
        // 在tableView中指定的索引位置插入新的行，并且执行动画
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        
        // 在tableView中重新加载指定索引位置cell的数据，并且执行动画
        reloadRows(at: modifications.map(IndexPath.fromRow), with: .automatic)
        
        // 结束一系列方法的调用
        endUpdates()
    }
}
