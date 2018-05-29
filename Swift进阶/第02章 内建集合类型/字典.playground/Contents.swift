//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、字典的基本使用 */

// 定义一个枚举类型
enum Setting {
    case text(String)
    case int(Int)
    case bool(Bool)
}

// 定义一个字典
let defaultSettings: [String: Setting] = [
    "Airplane Mode": .bool(false),
    "Name": .text("My iPhone")
]

// 注意，字典通过键进行查找的结果是一个可选值
let name = defaultSettings["Name"]
