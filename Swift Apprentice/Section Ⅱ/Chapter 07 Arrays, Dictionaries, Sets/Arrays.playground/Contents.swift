//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// An array is an ordered collection of values of the same type
// 数组是一个按顺序存储，并且元素类型相同的序列

/** 1、创建数组 */

// 1、使用字面量语法创建数组
let evenNumbers: [Int] = [2, 4, 6, 8]  // 明确指明数组的类型
let odd = [1, 3, 5, 7, 9]  // 让编译器根据赋值情况，自动推断出数组的具体类型(墙裂推荐使用)

// 2、创建一个空的数组
var emptyStringArray: [String] = []

// 3、创建并以此初始化多个元素相同的数组
let allZeros = Array(repeating: 0, count: 5)  // 创建一个拥有5各元素，并且每个元素均为0的[Int]数组

// 4、数组的泛型语法
let intArrays: Array<Int> = [1, 2, 3, 4, 5]  // 这是一种很弱智、很啰嗦的写法，仅仅是作为一个知识点来介绍，并不推荐使用




/** 2、访问数组中的元素 */

var shuKingdom = ["刘备", "诸葛亮", "关羽", "张飞", "赵云", "马超", "黄忠"]

// 使用数组的属性和相关方法
print(shuKingdom.isEmpty)  // false

if shuKingdom.count < 3 {
    print("蜀中无大将")
} else {
    print("蜀汉人杰地灵")
}

if let firstElement = shuKingdom.first {
    print("firstElement = \(firstElement)")
}
if let lastElement = shuKingdom.last {
    print("lastElement = \(lastElement)")
}
if let minElement = shuKingdom.min() {
    print("minElement = \(minElement)")
}
if let maxElement = shuKingdom.max() {
    print("maxElement = \(maxElement)")
}
