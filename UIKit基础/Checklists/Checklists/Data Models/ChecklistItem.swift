//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    
    /// 描述checklist item的文本内容
    var text = ""
    
    /// 存储是否需要checkmark标识
    var checked = false
    
    ///
    var dueDate = Date()
    
    ///
    var shouldRemind = false
    
    ///
    var itemID: Int
    
    func toggleChecked() {
        checked = !checked
    }
    
    override init() {
        
        // 每当应用创建一个新的ChecklistItem实例时，
        // 就向DataModel请求一个item对象的ID
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
}
