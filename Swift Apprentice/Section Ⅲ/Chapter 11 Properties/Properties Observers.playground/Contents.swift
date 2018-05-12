//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 定义一个结构体Level
struct Level {
    
    // 类型属性(存储的是所有结构体实例的公共数据)
    static var highestLevel = 1
    
    // 存储属性
    let id: Int
    var boss: String
    
    // 属性监听器
    var unlocked: Bool {
        
        didSet {
            
            if unlocked && id > Level.highestLevel {
                
                // 修改类型属性的值为id
                Level.highestLevel = id
            }
        }
    }
}

let myLevel = Level(id: 5, boss: "enrica", unlocked: true)
let highestLevel = Level.highestLevel
