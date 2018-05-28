//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、使用传统方式进行累加计算 */

let fibs = [0, 1, 1, 2, 3, 5, 8, 13, 21]
var total = 0
for num in fibs {
    total = total + num
}
total



/** 2、使用Reduce函数来执行累加操作 */

// reduce ⽅法对应这种模式，它把⼀个初始值 (在这⾥是 0) 以及⼀个将中间值 (total)
// 与序列中 的元素 (num) 进⾏合并的函数进⾏了抽象
let num = fibs.reduce(0){ $0 + $1 }  // fibs.reduce(0){ total, num in total + num }
num

// 运算符也是函数，所以我们也可以把上⾯的例⼦写成这样
let num2 = fibs.reduce(0, +)  // let num = fibs.reduce(0, { $0 + $1 })
num2
