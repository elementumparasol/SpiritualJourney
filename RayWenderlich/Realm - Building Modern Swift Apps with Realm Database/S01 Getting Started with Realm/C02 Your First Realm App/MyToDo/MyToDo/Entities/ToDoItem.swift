//
//  ToDoItem.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/2.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class ToDoItem: Object {
    
    // 自定义枚举类型Property
    enum Property: String {
        case id, text, isCompleted
    }
    
    // 方便Realm实现一些自定义的后台逻辑
    // 以自动映射这些属性到磁盘的持久化数据中
    dynamic var id = UUID().uuidString
    dynamic var text = ""
    dynamic var isCompleted = false
    
    // Realm将调用primaryKey()来决定将哪个属性用作对象的主键
    override static func primaryKey() -> String? {
        return ToDoItem.Property.id.rawValue
    }
    
    /// 创建新的待办事项
    ///
    /// - Parameter text: 待办事项描述
    convenience init(_ text: String) {
        self.init()
        self.text = text
    }
}


extension ToDoItem {
    
    /// 静态方法，从默认的Realm文件中获取所有待办事项
    ///
    /// - Parameter realm: 默认的Realm文件
    /// - Returns: 返回所有的待办事项
    static func all(in realm: Realm = try! Realm()) -> Results<ToDoItem> {
        
        // objects(_ : )用于从磁盘中获取某种类型的对象
        // sorted(byKeyPath :)按给定属性或键路径的值对它们进行排序
        return realm.objects(ToDoItem.self)
            .sorted(byKeyPath: ToDoItem.Property.isCompleted.rawValue)
    }
    
    
    /// 添加待办事项
    ///
    /// - Parameters:
    ///   - text: 待办事项文字描述
    ///   - realm: 默认的Realm文件
    /// - Returns: 返回ToDoItem实例(也就是待办事项)
    @discardableResult
    static func add(text: String, in realm: Realm = try! Realm()) -> ToDoItem {
        
        // 创建待办事项
        let item = ToDoItem(text)
        
        // 将新创建的待办事项写入到Realm中
        try! realm.write {
            realm.add(item)
        }
        
        return item
    }
}
