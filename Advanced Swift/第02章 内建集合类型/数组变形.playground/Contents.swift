//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、map函数的应用示例 */

// 数组变形(形变): 创建⼀个新数组，对已有数组中的元素进⾏循环依次取出其中元素，
// 对取出的元素进⾏操 作，并把操作的结果加⼊到新数组的末尾。或者通俗的将，就是
// 对数组中所有的元素按照某种标准做相同的操作

var fibs = [0, 1, 1, 2, 3, 5, 8]
var squared: [Int] = []  // 定义一个空的[Int]数组
for fib in fibs {
    squared.append(fib * fib)
}
squared  // [0, 1, 1, 4, 9, 25, 64], 也就是相当于在原来数组fibs的基础上，每个元素都执行平方操作

// Swift中有一个map函数可以很方便的指向上述操作
let squares = fibs.map {$0 * $0}  // fibs.map {fib in fib * fib}
squares  // [0, 1, 1, 4, 9, 25, 64]




/** 2、自己动手实现map函数 */
extension Array {
    
    // Element是数组中包含的元素类型的占位符，T是元素转换之后的类型的占位符
    // map函数本⾝并不关⼼Element和T究竟是什么，它们可以是任意类型。T的具体
    // 类型将由调⽤者传⼊给map的transform⽅法的返回值类型来决定
    func map<T>(_ transform: (Element) -> T) -> [T] {
        
        var result: [T] = []
        
        result.reserveCapacity(count)
        
        for x in self {
            
            result.append(transform(x))
        }
        
        return result
    }
}
