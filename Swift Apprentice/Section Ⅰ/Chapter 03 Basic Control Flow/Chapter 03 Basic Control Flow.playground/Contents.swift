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
