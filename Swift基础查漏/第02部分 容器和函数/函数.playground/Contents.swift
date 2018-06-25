import UIKit


/** 1、可变参数 */

// 可变参数(实际开发中自己写得不多，但是用得很多，最常见的就是print函数，因此要掌握)
func sum(numbers: Double...) -> Double {  // 参数列表numbers: Double...表示它是一个Double类型的可变参数
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}

let result = sum(numbers: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print(result)


/** 2、值类型参数的引用传递 */

func increment(_ value: inout Double, amount: Double = 1.0) {
    value += amount
}

var value: Double = 10

// 第一次调用函数
increment(&value)
print(value)  // 11

// 第二次调用函数
increment(&value, amount: 20)
print(value)  // 31


/** 3、嵌套函数 */

func calculate(_ opt: String) -> (Int, Int) -> Int {

    // 定义加法函数
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    // 定义减法函数
    func sub(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    
    // 存储计算结果
    var result: (Int, Int) -> Int
    
    switch (opt) {
    case "+":
        result = add
    case "-":
        result = sub
    default:
        result = add
    }
    
    return result
}

let f1: (Int, Int) -> Int = calculate("+")
print("50 + 60 = \(f1(50, 60))")
