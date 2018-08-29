//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import UserNotifications

class ChecklistItem: NSObject, Codable {
    
    /// 描述checklist item的文本内容
    var text = ""
    
    /// 存储是否需要checkmark标识
    var checked = false
    
    /// 计划日期
    var dueDate = Date()
    
    /// 记录是否需要提醒
    var shouldRemind = false
    
    /// item编号
    var itemID: Int
    
    /// 切换标记
    func toggleChecked() {
        checked = !checked
    }
    
    /// 设置通知计划
    func scheduleNotification() {
        
        removeNotification()
        
        // dueDate > Date(): 如果计划日期比现在大，说明计划日期
        // 是未来时间，否则就说明计划日期已经过时了
        if shouldRemind && dueDate > Date() {
            
            // 设置通知的文本内容，包括标题、文本和声音
            let content = UNMutableNotificationContent()
            content.title = "通知啦:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            // 设置时间格式(精确到分钟就已经足够了)
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.month, .day, .hour, .minute], from: dueDate)
            
            // 设置通知触发的时间
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            // 通知请求
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            // 将通知请求添加到通知中心
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
    /// 取消通知
    func removeNotification() {
        
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    
    override init() {
        
        // 每当应用创建一个新的ChecklistItem实例时，
        // 就向DataModel请求一个item对象的ID
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    deinit {
        removeNotification()
    }
}
