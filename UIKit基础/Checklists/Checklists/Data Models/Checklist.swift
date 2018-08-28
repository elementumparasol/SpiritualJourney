//
//  Checklist.swift
//  Checklists
//
//  Created by Enrica on 2018/8/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {

    /// Checklist实例的名字
    var name: String
    
    /// 图标名字
    var iconName = "No Icon"
    
    /// 用于保存items模型
    var items = [ChecklistItem]()
    
    /// 自定义构造方法
    ///
    /// - Parameter name: Checklist实例的名字
    init(name: String) {
        self.name = name
        super.init()
    }
    
    /// 显示未处理item的数量
    func countUncheckedItems() -> Int {
        
//        var count = 0
//
//        for item in items where !item.checked {
//            count += 1
//        }
//
//        return count
        
        
        // func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, ChecklistItem) throws -> Result) rethrows -> Result
        // - 参数cnt的初始值为0，如果item被标记了，则它的值为0；否则，它的值为1
        // - 最后，return语句会返回所有已经标记和未被标记值的总和
        return items.reduce(0) { cnt, item in cnt + (item.checked ? 0 : 1) }
    }
}
