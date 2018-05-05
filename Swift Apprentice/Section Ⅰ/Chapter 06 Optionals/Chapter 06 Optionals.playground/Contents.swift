//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 一般情况下，变量在定义的过程中应该要赋值
// 但是，在很多场合，变量的具体值要到后面才
// 知道，此时，可以先将变量声明为可选类型
var errorCode: Int?
errorCode = 100
errorCode = nil


/** 1、可选绑定 */
var name: String?
name = "enrica"
print(name)

// 使用可选绑定对可选类型的变量name进行解包
if let name = name {
    print("name = \(name)")
} else {
    print("变量name没有值")
}

// 还可以一次绑定多个值
var age: Int?
var height: Float?
age = 20
height = 1.78
if let age = age, let height = height {
    print("age = \(age), height = \(height)")
} else {
    print("There is no value.")
}

// 在值绑定的同时，对其进行某种筛选
if let age = age, let height = height, height >= 1.82 {
    
    // 只有当年龄有值、身高有值并且身高不低于1.82时，才会执行这里面的代码
    print("age = \(age), height = \(height)")
} else {
    print("年龄没有值，或者身高没有值，或者虽然身高有值，但是它小于1.82。")
}




/** 2、guard */

func maybeString(_ str: String?) {
    
    // 对传递进来的参数值进行校验
    guard let str = str else {
        return
    }
    
    print(str)
}
maybeString("enrica")
