//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    
    /// 描述checklist item的文本内容
    var text = ""
    
    /// 存储是否需要checkmark标识
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
