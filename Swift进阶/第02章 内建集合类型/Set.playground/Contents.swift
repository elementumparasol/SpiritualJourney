//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、Set的基本使用 */

// 集合是⼀组⽆序的元素， 每个元素只会出现⼀次
let naturals: Set = [1, 2, 3, 4, 5, 5, 5, 5, 5]  // 虽然元素5在集合中出现了多次，但是它最终只会被算作一次
print(naturals)

// 判断集合Set中是否包含某一个元素
naturals.contains(2)  // true
naturals.contains(10)  // false

