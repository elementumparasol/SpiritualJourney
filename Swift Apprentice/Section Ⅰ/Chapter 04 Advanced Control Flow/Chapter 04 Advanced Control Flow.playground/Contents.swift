//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



/** 1、范围运算符 */

// 闭区间运算符
let closedRange = 0...5  // 取值(0, 1, 2, 3, 4, 5)， 即[0, 5]

// 半开半闭区间
let halfOpenRange = 0..<5  // 取值(0, 1, 2, 3, 4)， 即[0, 5)



/** 2、for循环 */

let count = 10
var sum = 0
for i in 0..<count {
    sum += i
    print("sum = \(sum)")
}


sum = 1
var lastSum = 0
for _ in 0...count {
    let tmp = sum
    sum = sum + lastSum
    lastSum = tmp
    print("lastSum = \(lastSum)")
}


sum = 0
for i in 0...count where i % 2 == 1 {  // 使用关键字where对i的取值进行过滤(i只取奇数)
    sum = sum + i
    print("sum = \(sum)")
}
