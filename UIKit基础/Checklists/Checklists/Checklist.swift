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
    
    /// 用于保存items模型
    var items = [ChecklistItem]()
    
    /// 自定义构造方法
    ///
    /// - Parameter name: Checklist实例的名字
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
