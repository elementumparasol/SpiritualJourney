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



/** 4、switch语句 */

// 常规switch
let num = 10
switch num {
case 0:  // Swift中的case语句不需要写break语句，它默认是不穿透的
    print("整数0")
default:
    print("非零整数")
}

// 字符串儿switch
let string = "Dog"
switch string {
case "Cat", "Dog", "Cow":  // Swift中的switch语句不再仅限于整数值，并且一个case还可以对应多个
    print("家养牲畜")
default:
    print("野生动物")
}



/** 5、高级switch语句 */

// 一次匹配多个数值
let hourOfDay = 12
let timeOfDay: String
switch hourOfDay {
case 0, 1, 2, 3, 4, 5:
    print("凌晨时分")
case 6, 7, 8, 9, 10, 11:
    print("上午时分")
case 12, 13, 14, 15, 16, 17:
    print("下午时分")
case 18, 19, 20, 21:
    print("晚上")
case 22, 23, 24:
    print("深夜时分")
default:
    print("错误的数值")
}

// 范围匹配
switch hourOfDay {
case 0...5:
    print("凌晨时分")
case 6...11:
    print("上午时分")
case 12...17:
    print("下午时分")
case 18...21:
    print("晚上")
case 22...24:
    print("深夜时分")
default:
    print("错误的数值")
}

// 使用where关键字进行过滤
switch hourOfDay {
case let x where x % 2 == 0:
    print("偶数小时")
default:
    print("奇数小时")
}

// 因为x并没有用到，所以可以将其省略
switch hourOfDay {
case _ where hourOfDay % 2 == 0:
    print("偶数小时")
default:
    print("奇数小时")
}

// 局部匹配(Partial matching)
let coordinates = (x: 15, y: 20, z: 33)
switch coordinates {
case (0, 0, 0):
    print("在坐标原点")
case (_, 0, 0):
    print("在x轴上")
case (0, _, 0):
    print("在y轴上")
case (0, 0, _):
    print("在z轴上")
default:
    print("在坐标轴的其它位置")
}

