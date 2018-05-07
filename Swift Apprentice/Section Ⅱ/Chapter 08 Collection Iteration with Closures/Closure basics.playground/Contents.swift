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



/** 2、闭包的简便写法 */

// 因为只有一个语句，所以可以省略return
aClosureVariable = {(a: Int, b: Int) -> Int in a * b }
aClosureVariable(2, 3)

// 因为编译器可以做类型推断，所以可以省略参数和返回值类型
aClosureVariable = {(a, b) in a * b }
aClosureVariable(3, 5)

// 闭包的参数名也可以省略。我们使用$0表示闭包的第一个参数，
// $1表示闭包的第二个参数...$n表示闭包的第n个参数
aClosureVariable = { $0 * $1 }
aClosureVariable(3, 7)
