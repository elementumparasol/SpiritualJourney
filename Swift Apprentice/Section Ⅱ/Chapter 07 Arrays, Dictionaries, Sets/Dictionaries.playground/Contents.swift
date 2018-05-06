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
