//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// A set is an unordered collection of unique values of the same type.
// 集合Set是一个存储同类型元素的无序序列，并且Set中的元素都是独一无二的

/** 1、创建集合 */

// 因为集合没有字面量语法，因此在创建集合时，应该明确指明该集合的类型
var aSet: Set<Int> = [1, 2, 3, 4]
print(aSet)


/** 2、访问集合Set */
print(aSet.contains(2))
print(aSet.contains(100))



/** 3、增减元素 */
aSet.insert(100)
print(aSet)
aSet.insert(100)  // 因为Set中的元素不能重复，因此重复添加只能算作一次
print(aSet)

aSet.remove(2)
print(aSet)
