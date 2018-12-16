//
//  ToDoItem.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class ToDoItem: Object {
    
    // 属性的名称
    enum PropertyName: String {
        case id, text, isCompleted
    }
    
    /// 所创建对象的id
    dynamic var id = UUID().uuidString
    
    /// 描述文本
    dynamic var text = ""
    
    /// 用于标记ToDoList中的清单是否已完成
    dynamic var isCompleted = false
    
    // 用于返回对象的主键
    override static func primaryKey() -> String? {
        return ToDoItem.PropertyName.id.rawValue
    }
    
    /// 根据指定的文本内容创建ToDoItem对象
    ///
    /// - Parameter text: 用于描述所创建的对象
    convenience init(_ text: String) {
        self.init()
        self.text = text
    }
}


// MARK: - ToDoItem常用的方法
extension ToDoItem {
    
    
    /// 取出Realm数据库中所有的Realm对象
    ///
    /// - Parameter realm: Realm数据库
    /// - Returns: 返回Realm数据库中指定类型的数据
    static func all(in realm: Realm = try! Realm()) -> Results<ToDoItem> {
        
        // 返回Realm数据库中所有指定类型的对象
        // 并且所有的对象都按照isCompleted排序
        return realm.objects(ToDoItem.self)
            .sorted(byKeyPath: ToDoItem.PropertyName.isCompleted.rawValue)
    }
    
    /// 将Realm对象添加到Realm数据库中
    ///
    /// - Parameters:
    ///   - text: 用于描述所创建的ToDoItem对象
    ///   - realm: 用于存储数据的Realm数据库实例
    /// - Returns: 返回已经成功创建的ToDoItem实例
    @discardableResult
    static func add(text: String, in realm: Realm = try! Realm()) -> ToDoItem {
        let item = ToDoItem(text)
        try! realm.write {
            realm.add(item)
        }
        return item
    }
    
    /// 用于标记对象
    func toggleCompleted() {
        guard let realm = realm else { return }
        try! realm.write {
            isCompleted = !isCompleted
        }
    }
    
    /// 删除对象
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
