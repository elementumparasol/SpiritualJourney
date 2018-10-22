//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、数组切片 */

let fibs = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

// 获取数组fibs中除首元素之外的所有元素
let slice = fibs[1...]
slice

// 查看切片slice的类型
type(of: slice)  // ArraySlice<Int>.

// 注意: 切⽚类型只是数组的⼀种表⽰⽅式，它背后的数据仍 然是原来的数组，只不过是⽤切⽚的⽅式来进⾏表⽰
// 这意味着原来的数组并不需要被复制。ArraySlice 具有的⽅法和 Array 上定义的⽅法是⼀致的，因此你可以
// 把它当做数组来进⾏处理。实际上，你可以理解为，切片类型仅仅只是为了和数组类型做一个区分，用来告诉人们
// 它是一个切片，其它东西都和数组一致(数组能用的属性和方法，数组的切片照样可以无缝使用)

// 将数组切片转换为数组
let newFibs = Array(slice)
type(of: newFibs)  // Array<Int>
