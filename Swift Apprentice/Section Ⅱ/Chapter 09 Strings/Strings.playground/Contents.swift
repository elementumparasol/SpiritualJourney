//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、字符串String又是集合类型了 */
let enrica = "enrica"
for char in enrica {  // 因为String是集合类型，所以可以像其它集合类型一样，可以遍历
    print(char)
}

// 计算字符串的长度
let lenght = enrica.count

// 计算字符串的第一个索引
let firstIndex = enrica.startIndex

// 取出字符串中的第一个字符
let firstChar = enrica[firstIndex]  // 取出来的是字符e

// 计算字符串的最后一个索引
//let lastIndex = enrica.endIndex 不是真正的最后一个索引
let lastIndex = enrica.index(before: enrica.endIndex)

// 取出字符串最后一个字符
//let lastChar = enrica[lastIndex]  越界
let lastChar = enrica[lastIndex]  // 取出来的是字符a

// 计算字符串的第4个索引
let fourthIndex = enrica.index(enrica.startIndex, offsetBy: 3)
let fourthChar = enrica[fourthIndex]  // 取出来的是字符i



/** 2、字符串是双向集合 */
let name = "James"
let backwardsName = name.reversed()  // backwards是ReversedCollection<String>类型

// 尽管backwards是ReversedCollection<String>类型，但是你仍然可以像使用String类型一样来使用它
let nameLenght = enrica.count
let firstIndexOfName = name.startIndex
let firstCharOfName = name[firstIndexOfName]
let lastIndexOfName = name.index(before: name.endIndex)
let lastCharOfName = name[lastIndexOfName]
let thirdIndexOfName = name.index(name.startIndex, offsetBy: 2)
let thirdCharOfName = name[thirdIndexOfName]

// 将ReversedCollection<String>类型将转成String类型
let backwardsNameString = String(backwardsName)
