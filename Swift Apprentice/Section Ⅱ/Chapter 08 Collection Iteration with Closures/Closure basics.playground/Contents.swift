//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 闭包看上去更像是一个匿名函数，你可以将它赋值给一个变量，或者像其它任何变量一样，作为参数进行传递

/** 1、闭包基础 */

// 定义一个闭包
var aClosureVariable: (Int, Int) -> Int  // 一个函数类型的变量

// 将闭包赋值给一个同类型的变量
aClosureVariable = {(a: Int, b: Int) -> Int in
    return a * b
}

// 调用闭包
aClosureVariable(20, 30)
