//
//  UITableView+Extension.swift
//  Chatter
//
//  Created by Enrica on 2018/12/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// 在监听集合的更改时，如果有任何更改发生就做相应的处理
    ///
    /// - Parameters:
    ///   - deletions: 表示被删除对象的索引
    ///   - insertions: 表示被插入对象的索引
    ///   - updates: 表示被修改对象的索引
    func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
        
        // 开始更新
        beginUpdates()
        
        // 删除tableView中指定的行
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        
        // 在tableView中指定的位置插入新的元素
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        
        // 当改行数据发生更改时，重新加载改行，以显示新的数据
        reloadRows(at: updates.map(IndexPath.fromRow), with: .none)
        
        // 结束更新
        endUpdates()
    }
}
