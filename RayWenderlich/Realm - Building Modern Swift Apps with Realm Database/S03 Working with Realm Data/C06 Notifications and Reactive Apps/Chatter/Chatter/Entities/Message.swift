//
//  Message.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Message: Object {
    
    // MARK: - Message的属性
    
    /// 此属性主要用来作为主键
    dynamic var id = UUID().uuidString
    
    /// 消息创建日期
    dynamic var date = Date()
    
    /// 消息发送者
    dynamic var from = ""
    
    /// 消息内容
    dynamic var text = ""
    
    /// 标识是否为最新消息(默认为最新消息)
    dynamic var isNew = true
    
    
    // MARK: - 便利构造方法
    
    /// 根据指定的参数来创建Message实例
    ///
    /// - Parameters:
    ///   - from: 消息发送者
    ///   - text: 消息内容
    convenience init(from: String, text: String) {
        
        // 调用Message的代理初始化方法
        self.init()
        
        // 初始化from和text属性
        self.from = from
        self.text = text
    }
    
    
    // MARK: - 重写类自带的方法
    
    /// 重写此方法，以指定要用作主键的属性的名称
    ///
    /// - Returns: 返回要用作主键属性的名称
    override static func primaryKey() -> String? {
        return "id"
    }
}


// MARK: - Message
extension Message {
    
    /// Message中部分属性的名称(后续用于排序)
    public struct Properties {
        
        /// id属性的名称
        static let id = "id"
        
        /// date属性的名称
        static let date = "date"
    }
}
