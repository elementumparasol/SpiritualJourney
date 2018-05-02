//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、函数的基础知识 */

// 最简单的函数(无参数，无返回值)
func printHelloWorld() {
    print("Hello, World!")
}
printHelloWorld()

// 带有参数的函数
func sumOf(a: Int, b: Int) {
    print("\(a) + \(b) = \(a + b)");
}
sumOf(a: 20, b: 30)

// 省略形参名，或者给形参取一个外部参数名
func printMultipleOf(_ aNum: Int, and bNum: Int) {
    print("\(aNum) * \(bNum) = \(aNum + bNum)")
}
printMultipleOf(20, and: 5)  // 在调用函数时，第一个参数名省略了，第二个参数名重新命名了

// 提供默认参数
func printSumOf(_ num1: Int, _ num2: Int = 1) {
    print("\(num1) + \(num2) = \(num1 + num2)")
}
printSumOf(20)
printSumOf(20, 50)



/** 2、带有返回值的函数 */

// 返回一个字符串
func returnString() -> String {
    return "Hello, Swift!"
}
let greet = returnString()

// 返回一个元组
func returnStudentInformation(name: String, age: Int, height: Double) -> (String, Int, Double) {
    return (name, age, height)
}
let student = returnStudentInformation(name: "Jim", age: 20, height: 1.71)
print(student.0)
print(student.1)
print(student.2)

// 为了阅读方便，可以给返回的元组值添加说明标签
func returnSudentInfo(_ name: String, _ age: Int, _ height: Double) -> (name: String, age: Int, height: Double) {
    return (name, age, height)
}
let stu = returnSudentInfo("James", 25, 1.91)
print(stu.name)
print(stu.age)
print(stu.height)
