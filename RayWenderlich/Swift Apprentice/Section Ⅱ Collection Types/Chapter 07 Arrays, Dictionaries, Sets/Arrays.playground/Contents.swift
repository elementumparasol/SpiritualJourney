//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// An array is an ordered collection of values of the same type
// 数组是一个按顺序存储，并且元素类型相同的序列

/** 1、创建数组 */

// 1、使用字面量语法创建数组
let evenNumbers: [Int] = [2, 4, 6, 8]  // 明确指明数组的类型
let odd = [1, 3, 5, 7, 9]  // 让编译器根据赋值情况，自动推断出数组的具体类型(墙裂推荐使用)

// 2、创建一个空的数组
var emptyStringArray: [String] = []

// 3、创建并以此初始化多个元素相同的数组
let allZeros = Array(repeating: 0, count: 5)  // 创建一个拥有5各元素，并且每个元素均为0的[Int]数组

// 4、数组的泛型语法
let intArrays: Array<Int> = [1, 2, 3, 4, 5]  // 这是一种很弱智、很啰嗦的写法，仅仅是作为一个知识点来介绍，并不推荐使用




/** 2、访问数组中的元素 */

var shuKingdom = ["刘备", "诸葛亮", "关羽", "张飞", "赵云", "马超", "黄忠"]

// 使用数组的属性和相关方法
print(shuKingdom.isEmpty)  // false

if shuKingdom.count < 3 {
    print("蜀中无大将")
} else {
    print("蜀汉人杰地灵")
}

if let firstElement = shuKingdom.first {
    print("firstElement = \(firstElement)")
}
if let lastElement = shuKingdom.last {
    print("lastElement = \(lastElement)")
}
if let minElement = shuKingdom.min() {
    print("minElement = \(minElement)")
}
if let maxElement = shuKingdom.max() {
    print("maxElement = \(maxElement)")
}

// 使用数组的下标(使用下标时，要注意不能越界)
let firstName = shuKingdom[0]
let thirdName = shuKingdom[2]

// 使用数组切片
let arraySlice = shuKingdom[2...]  // 从下标为2的元素，一直取到数组的最后一位元素，注意，它所得到的结果是一个切片类型ArraySlice<String>
let fiveTigerlikeGenerals = Array(arraySlice)  // 将数组的切片类型强转成数组类型

// 判断数组中是否包含某个元素
if shuKingdom.contains("曹操") {
    print("数组中包含曹操")
} else {
    print("曹操不是蜀汉集团的人")
}



/** 3、修改数组 */

// 增加数组元素
shuKingdom.append("姜维")  // 使用内建方法
print(shuKingdom)

shuKingdom += ["魏延"]  // 同类型的数组可以直接相加
print(shuKingdom)

// 插入元素
shuKingdom.insert("马岱", at: 2)  // 注意，插入元素的时候不要越界
print(shuKingdom)

// 删除元素
shuKingdom.removeFirst()  // 删除第一个元素
print(shuKingdom)

shuKingdom.removeLast()  // 删除最后一个元素
print(shuKingdom)

shuKingdom.remove(at: 2)  // 删除指定位置的元素，同样注意不要越界
print(shuKingdom)

// 修改指定位置的元素
shuKingdom[2] = "关平"  // 也需要注意不能越界
print(shuKingdom)

shuKingdom[1...4] = ["庞统", "法正", "徐庶", "马良"]  // 一次修改多个指定的元素，但是也不能越界
print(shuKingdom)

// 交换指定索引位置元素的位置
shuKingdom.swapAt(0, 1)
print(shuKingdom)

// 给数组中的元素排序
shuKingdom.sort()
print(shuKingdom)




/** 4、遍历数组 */

// 使用for-in遍历
for item in shuKingdom {
    print(item)
}

for (idx, item) in shuKingdom.enumerated() {
    print("\(idx): \(item)")
}

// 使用forEach遍历
shuKingdom.forEach { (item) in
    print(item)
}
