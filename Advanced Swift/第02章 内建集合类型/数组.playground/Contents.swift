//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、数组和可变性 */

// 常量数组
let fibs = [0, 1, 1, 2, 3, 5]

// 可变数组
var mutableFibs = [0, 1, 1, 2, 3, 5]
mutableFibs.append(8)  // 往可变数组的末尾添加一个元素
mutableFibs.append(contentsOf: [13, 21])  // 往数组的末尾添加一个同类型的数组序列

// 需要特别注意的是，关键字let所定义的类实例，我们只能保证它的引用不会改变，
// 也就是说，你不能再给这个引用赋一个新的值。但是，该引用所指向的对象是可以改变的。


// 数组和标准库中所有的集合类型都是值语义(也就是值类型)
// 值类型的一个特点是，在被赋值时，其内容会被复制
var x = [1, 3, 5]
var y = x
y.append(7)
print(x)  // [1, 3, 5]
print(y)  // [1, 3, 5, 7]



/** 2、Foundation中的数组 */

let a = NSMutableArray(array: [1, 3, 5, 7])
let b: NSArray = a  // 数组b是用let修饰的
a.insert(9, at: a.count)  // 修改数组a中的内容
b  // 但是最后数组b还是被修改了。为什么？主要是Foundation中的数组是对象，因此是引用类型


let c = NSMutableArray(array: [2, 4, 6, 8])

// 手动复制
let d = c.copy() as! NSArray
c.insert(10, at: c.count)  // [2, 4, 6, 8, 10]
d  // [2, 4, 6, 8]
