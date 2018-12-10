//
//  ChatAPI.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import UIKit

class ChatAPI {
    
    // MARK: - 自定义属性
    
    /// 自定义一个闭包类型，并且为它取一个别名
    typealias MessagesCallback = ([(String, String)]) -> Void
    
    /// 回调代码块
    private var callback: MessagesCallback?
    
    
    // MARK: - 自定义方法
    
    /// "连接"到ChatAPI，然后定期获取消息，并且将其提供给回调
    ///
    /// - Parameter callback: 回调代码块
    func connect(withMessagesCallback callback: @escaping MessagesCallback) {
        
        // 给代码回调callback赋值
        self.callback = callback
        
        // 接收服务器消息
        receiveMessages()
    }
    
    /// 模拟接收服务器信息
    private func receiveMessages() {
        
        // 用于存储获取到的消息
        var messages = [(String, String)]()
        
        // 获取遍历以获取随机消息
        for _ in 0...random(min: 1, max: 3) {
            
            // 将文本消息和消息发送者存储到数组messages中
            messages.append((from.randomElement(), phrases.randomElement()))
        }
        
        // 打开网络活动指示器，用于模拟从网络上获取数据
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // 在指定的时间之后，在主队列中异步执行代码
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            
            // 执行回调
            self?.callback?(messages)
            
            // 关闭网络活动指示器
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        // 在指定的时间之后，在主队列中异步执行代码
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(random(min: 5, max: 10))) {[weak self] in
            
            self?.receiveMessages()
        }
    }
    
    /// 模拟的消息文本列表
    private let phrases = ["hello everyone", "hey hey hey", "anyone around?", "Bye", "I'm outta here", "I have a question", "testing testing ... 1, 2, 3", "wubalubadubdub"]
    
    /// 模拟的消息发送者列表
    private let from = ["Josh", "Jane", "Peter", "Sam", "Ray", "Paul", "Adam", "Lana", "Derek", "Patrick"]
}


/// 随机数生成器函数(不是Message的方法)
///
/// - Parameters:
///   - min: 用于调整生成的随机数
///   - max: 用于生成随机数的种子(基数)
/// - Returns: 返回生成的随机数
private func random(min: UInt32, max: UInt32) -> Int {
    return Int(arc4random_uniform(max) + min)
}


// MARK: - Array
extension Array {
    
    /// 随机获取数组中的元素
    ///
    /// - Returns: 返回数组中的元素
    func randomElement() -> Element {
        
        // random(min: 0, max: UInt32(count-1))随机获取数组中合法的下标
        return self[random(min: 0, max: UInt32(count-1))]
    }
}


