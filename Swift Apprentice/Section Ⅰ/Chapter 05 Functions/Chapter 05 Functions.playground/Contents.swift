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



/** 3、函数重载 */

// 函数名称相同，但是参数和返回值不同，就可以构成函数重载
// 函数重载的三个表现方面：①参数个数不同；②参数类型不同
// ③函数的返回值不同
func overloadingFunc(a: Int, b: Int) {
    print("第一个函数")
}

func overloadingFunc(a: String, b: String) {
    print("第二个函数")
}

func overloadingFunc(_ a: Int, _ b: Int) {
    print("第三个函数")
}

func overloadingFunc(a: Float) {
    print("第四个函数")
}

func overloadingFunc(a: Int, b: String) -> String {
    return "Hello, Swift"
}

func returnFunc() -> String {
    return "Hello, Swift"
}

func returnFunc() -> Int {
    return 0
}

// 需要注意的是，如果是返回值不同的构造函数，在调用的时候
// 需要特别指定类型，否则会编译器很可能会不知道要调用那个
let aFunc: String = returnFunc()  // 明确指明是调用String类型的函数
let bFunc: Int = returnFunc()  // 明确指明是调用Int类型的函数



/** 4、将函数作为变量 */

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

var funcVariable = add  // 将函数赋值给(Int, Int) -> Int类型的变量funcVariable
funcVariable(20, 30)  // 直接使用变量funcVariable

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

funcVariable = subtract  // 将函数赋值给变量funcVariable
funcVariable(100, 30)  // 直接使用变量funcVariable

// 除了可以将函数赋值给变量，将其作为变量使用之外，还可以将函数作为另一个函数的参数来传递
func funcAsPara(_ aFunc: @escaping (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = aFunc(a, b)
    print("result = \(result)")
}
funcAsPara(subtract, 100, 20)




/** 5、Never */
func noReturn() -> Never {  // Never类型表示函数有返回值，但是在正常情况下，这个返回值永远都不会返回
    while true {
        
    }
}
