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




/** 3、SubString(字符串String的子类类型) */

let fullName = "LeBron James"

// 计算出fullName中的空字符所在的索引
let spaceIndex = fullName.index(of: " ")!

// 从fullName中截取出firstName
let firstName = fullName[fullName.startIndex..<spaceIndex]  // 它是一个Substring类型，可以用fullName[..<spaceIndex]

// 使用单边范围从fullName中截取出lastName
//let afterSpaceIndex = fullName.index(spaceIndex, offsetBy: 1)  // 算出空字符后面一位字符的索引
let afterSpaceIndex = fullName.index(after: spaceIndex)  // 也是算出空字符后面一位字符的索引
let lastName = fullName[afterSpaceIndex...]

// 使用子字符串类型(Substring)的好处是什么？就是当你从字符串类型(String)的变量
// 中截取子字符串的时候，不用额外的开辟存储空间。当你想从Substring类型的子字符串
// 中创建String类型的字符串时，才会开辟新的存储空间。Substring类型和String类型
// 公用绝大部分属性或者方法，在使用Substring的过程中，如果不是强制要求使用String
// 类型，你根本就不会意识到Substring和String有什么不同
