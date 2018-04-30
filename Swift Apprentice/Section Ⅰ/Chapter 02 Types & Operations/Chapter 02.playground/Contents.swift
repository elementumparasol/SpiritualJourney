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



/** 5、字符串插值运算 */

// 可以使用字符串插值的方式来打印需要的字符串
message = "my name is \(name)" + "!"
print(message)

let a = 12
let b = 40
let c = Float(a) / Float(b)
print("\(a) / \(b) = \(c)")



/** 6、多行字符串 */

// 可以通过连续三个双引号的方式来实现多行格式化的字符串
let tangPoetry = """
    白衣依山尽，
    黄河入海流。
    欲穷千里目，
    更上一层楼。
"""
print(tangPoetry)




/** 7、元组 */

// 数轴上的一个点
let point: (Float, Float) = (1.2, 3)  // 数轴第一象限中的某个点
print(point.0)  // 取出元组中的第一个元素
print(point.1)  // 取出元组中的第二个元素

let aPoint = (x: -2, y: 1.4)  // 数轴上第二象限中的某个点，使用类型推断和成员命名
print(aPoint.x)  // 按照元组中成员命名的方式取出对应的元素
print(aPoint.y)

// 使用元组来保存一个人的姓名、年龄和身高等信息
let aPerson = (name: "Jim", age: 20, height: 1.78)
print(aPerson.name)
print(aPerson.age)
print(aPerson.height)


