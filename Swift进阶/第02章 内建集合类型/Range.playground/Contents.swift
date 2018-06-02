//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、范围Range的基本用法 */

// 0 到 9, 不包含 10
let singleDigitNumbers = 0..<10

// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]，不包含尾部元素10
Array(singleDigitNumbers)

// 包含尾部元素"z"
let lowercaseLetters = Character("a")...Character("z")

// 包含从0开始的所有数字
let fromZero = 0...

// 包含除了字母"z"之外的所有字符
let upToZ = ..<Character("z")



/** 2、可数范围 */

for i in 0..<10 {
    print("编号: \(i)")
}

// 是因为 0..<10 的类型其实是⼀个 CountableRange<Int>。 CountableRange和Range
// 很相似，只不过它还需要⼀个附加约束：它的元素类型需要遵守Strideable协议(以整数为步⻓)
// Swift将这类功能更强的范围叫做可数范围，这是因为只有这 类范围可以被迭代
// 可数范围的边界可以是整数或者指针类型，但不能是浮点数类型，这是由于Stride类型中有⼀个整数的约束
