//
//  DataModel.swift
//  Checklists
//
//  Created by Enrica on 2018/8/27.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

/**
 管理所有的数据模型
 主要用于AllListViewController中保存和加载数据的功能
 */

class DataModel {
    
    /// checklist模型数组
    var lists = [Checklist]()
    
    /// 计算属性，用与获取存储的行号
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
        }
    }
    
    // 因为DataModel没有继承自任何类，
    // 所以，这里不需要调用super.init()
    init() {
        
        // 加载数据
        loadChecklists()
        
        // 注册default
        registerDefaults()
        
        // 处理应用第一次启动的情况
        handleFirstTime()
    }
    
    /// 注册偏好设置
    func registerDefaults() {
        
        let dictionary: [String: Any] = ["ChecklistIndex": -1, "FirstTime": true]
        
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    /// 处理第一次安装和登录应用时的偏好设置
    func handleFirstTime() {
        
        let userDefaults = UserDefaults.standard
        
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    
    /// 给checklist排序
    func sortChecklist() {
        
        /*
         localizedStandardCompare表示按照当地语言标准排序，也就是说
         华语地区、英语地区和法语地区，排序的结果可能会不一样
        lists.sort { (checklist1, checklist2) -> Bool in
            return checklist1.name.localizedStandardCompare(checklist2.name) == .orderedAscending
        }
        
        lists.sort(by: {$0.name.localizedStandardCompare($1.name) == .orderedAscending})
        */
        
        lists.sort { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
    }
}

// MARK: - 获取沙盒中的Documents文件夹
extension DataModel {
    
    /// 获取Documents文件夹路径
    func documentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    /// 创建plist文件的路径
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
}


// MARK: - 沙盒数据的读取和写入
extension DataModel {
    
    /// 将数据写入到沙盒中Documents目录下的.plist文件中
    func saveChecklists() {
        
        // 创建PropertyListEncoder实例
        let encoder = PropertyListEncoder()
        
        // 处理错误(对会抛出异常的方法进行处理)
        do {
            
            // encode方法在无法对目标进行编码时，会抛出异常
            // 所以需要用do-catch对其进行处理
            let data = try encoder.encode(lists)  // Encodable协议
            
            // 如果encode方法执行成功，就将数据些人到目标文件(即Checklists.plist)
            // 因为write(to: options:)方法也会抛出异常，所以这里也要进行异常处理
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            
            // encode方法执行失败时，会进入到catch分支
            print("对items数组进行编码时发生错误!")
        }
    }
    
    /**
     对会抛出异常的方法进行异常处理，有两种常见的方式:
     - (1)、使用try?
     - (2)、在do-catch代码块中使用try
     */
    
    
    /// 读取沙盒中Documents文件夹里面的plist数据
    func loadChecklists() {
        
        // 获取Checklist.plist文件的路径
        let path = dataFilePath()
        
        // 读取Checklist.plist文件中的数据，并且将其转换成Data数据
        if let data = try? Data(contentsOf: path) {
            
            // 创建PropertyListDecoder实例
            let decoder = PropertyListDecoder()
            
            // 对decode方法进行异常处理
            do {
                
                // 对items进行解码
                lists = try decoder.decode([Checklist].self, from: data)
                
                // 对结果进行排序
                sortChecklist()
            } catch {
                
                // 如果decode方法执行失败，则进入到catch分支里面执行print()
                print("对items数组进行解码时发生错误!")
            }
        }
    }
}
