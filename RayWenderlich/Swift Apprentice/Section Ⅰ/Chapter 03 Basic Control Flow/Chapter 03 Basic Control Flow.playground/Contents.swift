//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、Bool类型 */

// 基本的Bool类型
let yes = true  // Bool类型的结果只有一种，要么是true，要么就是false
let no = false

let doesOneEqualTwo = (1 == 2)
print(doesOneEqualTwo)

let doesOneNotEqualTwo = (1 != 2)
print(doesOneNotEqualTwo)

let alsoTure = !(1 == 2)
print(alsoTure)

let oneIsGreaterThanTwo = (1 > 2)
print(oneIsGreaterThanTwo)

let oneIsLessThanTwo = (1 < 2)
print(oneIsLessThanTwo)

let and = true && true
let or = true || true



/** 2、字符串的比较 */

let dog = "dog"
let dogEqualsToCat = dog == "cat"  // 结果为false，因为字符串"dog"不等于字符串"cat"

let order = "dog" < "cat"  // 判断字符串"dog"出现的顺序是否比字符串"cat"出现的顺序低



/** 3、if语句 */

// 单纯的if结构
if 2 > 1 {  // Swift中if判断条件不需要加小括号，当然，加了小括号也不会出错
    print("整数2比1大")
}

// if-else结构
let animal = "Fox"
if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

// if-else if结构
let hourOfDay = 12
let timeOfDay: String
if hourOfDay < 6 {
    timeOfDay = "Early Morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late Evening"
} else {
    timeOfDay = "Invalid Hour."
}
print(timeOfDay)



/** 4、短路运算 */

let name = "Mat"
if 1 > 2 && name == "Mat" {  // 因为第一个条件1 > 2是错误的，所以在&&连接的运算符中，name == "Mat"不会参与运算
    print("这里永远都不会执行.")
}

if 1 < 2 || name == "James" {  // 同理，因为1 < 2成立，所以在||连接的运算符中，后面的name = "James"也没有必要参与运算
    print("这个语句会被执行。")
}

// 所谓的短路运算，就是指在有多个连续组合的表达式中，如果有第一个表达式就能判定整个表达式的结果，那么后面的表达式就不必参与运算




/** 5、三元运算符(条件运算符) */
let a = 5
let b = 10

var min: Int
if a < b {
    min = a
} else {
    min = b
}
print("min = \(min)")

var max: Int
if a > b {
    max = a
} else {
    max = b
}
print("max = \(max)")

// 使用三元运算符对上面的代码进行改写
min = a < b ? a : b
print("min = \(min)")

max = a > b ? a : b
print("max = \(max)")




/** 6、while循环 */

// 常用的while循环
var sum = 1
while sum < 1000 {
    sum = sum + (sum + 1)
    print(sum)
}


// repeat-while循环
sum = 1
repeat {
    sum = sum + (sum + 1)
    print("sum = \(sum)")
} while sum < 1  // 不管条件是否成立，至少执行一次


// break语句
sum = 1
while true {
    sum = sum + (sum + 1)
    print("sum = \(sum)")
    
    // 使用break终结死循环
    if sum > 1000 {
        break
    }
}
