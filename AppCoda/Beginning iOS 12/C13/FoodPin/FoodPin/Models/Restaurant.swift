//
//  Restaurant.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

class Restaurant: NSObject {
    
    // MARK: - 存储属性
    
    /// 餐厅名称
    var name: String
    
    /// 餐厅类型
    var type: String
    
    /// 餐厅位置
    var location: String
    
    /// 图片的名称
    var imageName: String
    
    /// 标记餐厅是否已经访问过
    var isVisited: Bool
    
    
    // MARK: - 构造方法
    
    /// 指定构造方法，在创建对象时给对象的各属性赋值
    ///
    /// - Parameters:
    ///   - name: 餐厅名称
    ///   - type: 餐厅类型
    ///   - location: 餐厅位置
    ///   - imageName: 餐厅图片名称
    ///   - isVisited: 是否访问过餐厅
    init(name: String, type: String, location: String, imageName: String, isVisited: Bool) {
        
        // 利用参数给对象的各属性赋值(初始化)
        self.name = name
        self.type = type
        self.location = location
        self.imageName = imageName
        self.isVisited = isVisited
    }
    
    /// 便利构造方法，在创建对象时，使用默认的参数给各属性赋值
    convenience override init() {
        
        // 调用上面定义的构造方法
        self.init(name: "", type: "", location: "", imageName: "", isVisited: false)
    }
}
