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



/** 2、集合Set的代数 */

let iPods: Set = ["iPod touch", "iPod nano", "iPod mini", "iPod shuffle", "iPod Classic"]
let discontinuedIPods: Set = ["iPod mini", "iPod Classic", "iPod nano", "iPod shuffle"]

// 计算上述两个集合Set的补集
let subtracting = iPods.subtracting(discontinuedIPods)
print(subtracting)

// 计算上述两个集合的交集(找出两个集合中都含有的元素)
let intersection = iPods.intersection(discontinuedIPods)
print(intersection)

// 计算上述两个集合的并集(将两个集合合并为⼀个)
var discontinued: Set = ["iBook", "Powerbook", "Power Mac"]
discontinued.formUnion(discontinuedIPods)
print(discontinued)

