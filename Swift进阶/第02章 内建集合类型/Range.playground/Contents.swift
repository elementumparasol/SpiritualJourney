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



/** 3、部分范围 */

// 部分范围 (partial range) 指的是将 ... 或 ..< 作为前置或者后置运算符来使⽤时所构造的范围
// 这类范围由于缺少⼀侧的边界，因此被称为部分范围。部分范围也称之为单边范围

// PartialRangeFrom不能被迭代，这是因为它的Bound不满⾜Strideable
let fromA: PartialRangeFrom<Character> = Character("a")...

// PartialRangeThrough则是因为没有下界⽽⽆法开始迭代
let throughtZ: PartialRangeThrough<Character> = ...Character("z")


// PartialRangeUpTo同样也是因为没有下界⽽⽆法开始迭代
let upToTen: PartialRangeUpTo<Int> = ..<10  // 注意，这里<和数字10之间是没有空格的

// 其中能够计数的只有CountablePartialRangeFrom这⼀种类型，四种部分范围类型中，只有它能被进⾏迭代
let fromFive: CountablePartialRangeFrom<Int> = 5...

// 迭代操作会从lowerBound开始，不断重复地调⽤advanced(by: 1)。如果你在⼀个for循环中使⽤这种范围，
// 你必须牢记要为循环添加⼀个break的退出条件，否则循环将⽆限进⾏下去(或者当计数溢出的时候发⽣崩溃)



/** 4、范围表达式 */

// 对于下界缺失的部分范围，relative(to:)⽅法会把集合类型的startIndex作为范围下界
// 对于 上界缺失的部分范围，同样，它会使⽤endIndex作为上界

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
array[5...]  // 无下界切片(即下界默认为数组中的最后一个元素的索引)，结果为[6, 7, 8, 9]
array[..<5]  // 无上界切片(即上界默认为数组中的第0个元素的索引)，结果为[1, 2, 3, 4, 5]
array[3...4]  // 上下界都有，结果为[4, 5]
array[...]  // 省略上下界，将得到整个数组切片，[1, 2, 3, 4, 5, 6, 7, 8, 9]
