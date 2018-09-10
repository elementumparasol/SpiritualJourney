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


// 利用属性监听器对一个变量进行限制
struct LightBulb {
    
    // 类型属性
    static let maxCurrent = 40
    
    // 属性监听器
    var current = 0 {
        
        // 监听属性current的改变
        didSet {
            if current > LightBulb.maxCurrent {
                print("当前的值过大，还是回到之前的值")
                current = oldValue
            }
        }
    }
}

var light = LightBulb()

// 设置结构体属性current的值
light.current = 50
var current = light.current  // 一旦current > LightBult.maxCurrent, 那么current = 0
print("current = \(current)")

// 重新设置结构体属性current的值
light.current = 30
current = light.current
print("current = \(current)")

/**
 * current的值是有限制的，一旦current > LightBult.maxCurrent，
 * 则current的值就设置失败；只有当current <= LightBult.maxCurrent
 * 的时候，current的值才能设置成功
 */

