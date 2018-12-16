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
    
    // MARK: - ToDoItem的属性
    
    // ToDoItem属性的名称
    enum PropertyName: String {
        case id, text, isCompleted
    }
    
    /// ToDoItem对象的id
    dynamic var id = UUID().uuidString
    
    /// 用于创建ToDoItem对象时所使用的描述文本
    dynamic var text = ""
    
    /// 用于标记当前的ToDoItem对象是否已经完成
    dynamic var isCompleted = false
    
    
    // MARK: - 重写Realm中的方法
    
    // 用于返回当前ToDoItem对象的主键
    override static func primaryKey() -> String? {
        return ToDoItem.PropertyName.id.rawValue
    }
    
    
    // MARK: - 自定义构造方法
    
    /// 根据指定的文本内容创建ToDoItem对象
    ///
    /// - Parameter text: 用于创建ToDoItem对象时所使用的文本
    convenience init(_ text: String) {
        self.init()
        self.text = text
    }
}


// MARK: - ToDoItem常用的方法
extension ToDoItem {
    
    /// 从Realm数据库中取出所有的ToDoItem对象
    ///
    /// - Parameter realm: Realm数据库
    /// - Returns: 从Realm数据库中返回所有指定类型的对象数据
    static func all(in realm: Realm = try! Realm()) -> Results<ToDoItem> {
        
        // 从Realm数据库中返回所有指定类型的对象
        // 并且将这些对象按照是否标记进行排序
        return realm.objects(ToDoItem.self)
            .sorted(byKeyPath: ToDoItem.PropertyName.isCompleted.rawValue)
    }
    
    /// 创建ToDoItem对象，并且将其添加到Realm数据库中
    ///
    /// - Parameters:
    ///   - text: 创建ToDoItem对象时的描述性文字
    ///   - realm: Realm数据库
    /// - Returns: 返回已经创建的ToDoItem实例
    @discardableResult
    static func add(text: String, in realm: Realm = try! Realm()) -> ToDoItem {
        let item = ToDoItem(text)
        try! realm.write {
            realm.add(item)
        }
        return item
    }
    
    /// 标记当前所选中的ToDoItem对象数据
    func toggleCompleted() {
        guard let realm = realm else { return }
        try! realm.write {
            isCompleted = !isCompleted
        }
    }
    
    /// 从Realm数据库中删除指定的ToDoItem对象
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
