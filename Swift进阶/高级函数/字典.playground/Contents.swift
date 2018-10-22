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



/** 2、字典的可变性 */

// 使用let定义的字典是不可变的；使用var定义的字典是可变的
var userSettings = defaultSettings

// 直接通过键对字典进行修改
userSettings["Name"] = .text("Jared's iPhone")
userSettings["Do Not Disturb"] = .bool(true)

// 使用字典的方法对字典中的值进行修改
let oldName = userSettings .updateValue(.text("Jane's iPhone"), forKey: "Name")
userSettings["Name"]
oldName



/** 3、字典中常用的方法 */

var settings = defaultSettings
let overriddenSettings: [String:Setting] = ["Name": .text("Jane's iPhone")]

// merge(_:uniquingKeysWith:)，它接受两个参数，第⼀个是要进⾏合并
// 的键值对，第⼆个是定义如何合并相同键的两个值的函数。我们可以使⽤这个
// ⽅法将⼀个字典合并⾄另⼀个字典中去
settings.merge(overriddenSettings, uniquingKeysWith: { $1 })
settings  // ["Name": {text "Jane's iPhone"}, "Airplane Mode": {bool false}]


/** 4、*/
extension Sequence where Element: Hashable {
    
    var frequencies: [Element:Int] {
        let frequencyPairs = self.map { ($0, 1) }
        return Dictionary(frequencyPairs, uniquingKeysWith: +)
    }
}

let frequencies = "hello".frequencies
frequencies.filter { $0.value > 1 }

let settingsAsStrings = settings.mapValues { setting -> String in
    switch setting {
        case .text(let text): return text
        case .int(let number): return String(number)
        case .bool(let value): return String(value)
    }
}

settingsAsStrings  // ["Name": "Jane's iPhone", "Airplane Mode": "false"]
