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




/** 2、不同类型的变量进行混合运算 */
let hourlyRate = 19.5
let hoursWorked = 10

// 不同类型的变量在进行运算之前，必须先统一类型
let totalCost = hourlyRate * Double(hoursWorked)



/** 3、Swift中的字符串 */

// Character和String类型
let characterA: Character = "a"  // 在Swift中，不管是字符类型还是字符串类型，都必须使用双引号

let characterDog: Character = "🐶"  // emoji表情算做单个字符

let stringDog: String = "Dog"

let stringCat = "Cat"  // 不必显示的指明变量的类型，编译器会根据初始化结果来对变量类型进行类型推断



/** 4、字符串的连接 */

var message = "Hello, " + "my name is "
let name = "enrica"
message += name  // 字符串变量可以直接使用加号运算符进行连接
print(message)

let exclamationMark: Character = "!"
message += String(exclamationMark)
print(message)
