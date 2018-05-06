//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// A dictionary is an unordered collection of pairs, where each pair is comprised of a key and a value.
// 字典是一个无序的键值对序列，也就是说字典中的每一对都是有键和值构成


/** 1、创建字典 */

// 创建字典最简单的方式(推荐使用)
var nameOfCavs = ["LeBron James": 23, "Kevin Love": 0, "Kyle Korver": 26, "George Hill": 3, "JR Smith": 5]
print(nameOfCavs)

// 创建空的字典
var names: [String: Int] = [:]
names.reserveCapacity(15)  // 分配字典names的存储容量

// 比较二的创建方式，不推荐使用
var aDict: Dictionary<String, Int> = [:]  // 创建一个空的字典
var bDict = Dictionary<Float, String>()  // 创建一个空的字典




/** 2、访问字典中的值 */

// 通过键来访问字典中的值(通过键访问字典中的值，所得的结果是一个可选类型)
if let number = nameOfCavs["LeBron James"] {
    print(number)
}

// 使用字典的属性或者方法
print(nameOfCavs.isEmpty)  // 判断字典是否为空
print(nameOfCavs.count)  // 计算字典中键值对的个数




/** 3、修改字典 */

// 增加或者修改键值对
nameOfCavs.updateValue(6, forKey: "LeBron James")  // 如果Key已经存在，则会修改原来的值
print(nameOfCavs)
nameOfCavs.updateValue(8, forKey: "Jordan Clarkson")  // 如果Key不存在，那么会新增键值对
print(nameOfCavs)

// 增加或者修改键值对更简单的方式
nameOfCavs["LeBron James"] = 23  // 修改已经存在的键值对
print(nameOfCavs)
nameOfCavs["Jose Calderon"] = 81  // 新增键值对
print(nameOfCavs)

// 移除键值对
nameOfCavs.removeValue(forKey: "Jordan Clarkson")
print(nameOfCavs)
nameOfCavs.removeValue(forKey: "Kyrie Irving")  // 从字典中移除一个不存在的键值对，其返回值为nil
print(nameOfCavs)

// 移除键值对更简单的方式
nameOfCavs["George Hill"] = nil
print(nameOfCavs)


