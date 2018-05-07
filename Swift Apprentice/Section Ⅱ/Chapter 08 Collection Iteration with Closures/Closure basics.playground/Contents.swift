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




/** 3、闭包作为函数参数 */
func operations(a: Int, b: Int, opt: (Int, Int) -> Int) -> Int {
    
    let result = aClosureVariable(a, b)
    print(result)
    return result
}

operations(a: 2, b: 5, opt: {(a: Int, b: Int) -> Int in a * b })
operations(a: 50, b: 20, opt: {$0 * $1})
operations(a: 12, b: 3) {$0 * $1}  // 尾随闭包的形式



/** 4、使用闭包进行遍历、筛选等操作 */

let intValue = [1, 3, 5, 7, 9]

// 遍历
intValue.forEach {
    print($0 * $0)
}

let doubleValue = [1.41, 1.73, 2.78, 3.14, 5.99, 20.99]

// 筛选数据
doubleValue.filter {
    return $0 > 3
}

// 映射
intValue.map {
    return $0 * 9
}

// reduce
intValue.reduce(0) {
    return $0 + $1
}


