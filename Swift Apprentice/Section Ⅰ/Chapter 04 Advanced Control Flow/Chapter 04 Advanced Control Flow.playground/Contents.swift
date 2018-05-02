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



/** 3、continue和label标签 */

// 使用continue
sum = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    
    for column in 0..<8 {
        sum += row * column
        
        print("在for循环中使用continue: \(sum)")
    }
}

// 使用label标签
sum = 0

// 定义一个rowLabel
rowLabel: for row in 0..<8 {
    
    // 定义一个columnLabel标签
    columnLabel: for column in 0..<8 {
        if row == column {
            
            // 跳过rowLabel，继续执行下一个循环
            continue rowLabel
        }
        
        sum += row * column
        print("在for循环中使用label标签: \(sum)")
    }
}
