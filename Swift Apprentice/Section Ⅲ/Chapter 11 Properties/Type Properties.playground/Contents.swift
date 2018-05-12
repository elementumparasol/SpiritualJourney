//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 定义一个Level结构体
struct Level {
    let id: Int
    var boss: String
    var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)


// 定义一个Level2结构体
struct Level2 {
    
    // 类型属性一static开头，一般用来存储对同类型所有实例都相同的信息
    static var highestLevel = 1  // 也就是说，只要是通过Level2创建出来的实例，它都包含static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}

let myLevel = Level2(id: 0, boss: "enrica", unlocked: true)

// Error: you can't access a type property on an instance
// 你不能通过结构体的实例去访问结构体中的的类型属性
// let highestLevel = myLevel.highestLevel

// 只能通过结构体类型本身去访问结构体中的类型属性
let highestLevel = Level2.highestLevel


/**
 * 注意：结构体的类型属性一般是用static声明，它里面存储的是结构体所有实例
 * 公共的数据；如果要访问结构体的类型属性，必须通过结构体类型本身去访问
 */
