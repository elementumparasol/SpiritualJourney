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
