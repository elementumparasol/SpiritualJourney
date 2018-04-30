//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、类型强转 */

// 明确声明变量类型
var integer: Int = 100

// 利用类型推断
var decimal = 3.1415  // 编译器推断其为Double

// 不同类型的变量不能进行运算，如有需要，必须先统一变量类型
integer = Int(decimal)  // 先将变量decimal强转成Int类型，然后赋值给变量integer





