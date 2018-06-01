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
