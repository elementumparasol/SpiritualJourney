import UIKit

/** 1、数组(Array) */

// 数组的声明和初始化
let arr1: Array<Int> = [1, 2, 3]
let arr2: [Int] = [1, 2, 3]
let arr3 = [1, 2, 3]

print("--------- Array ---------")

// 声明和初始化空的数组
let arr4: Array<String> = Array()
print(arr4.count)
let arr5: [String] = []
print(arr5.count)
let arr6 = [String]()
print(arr6.count)
// 切记！仅仅只是做了声明，但是未被初始化的数组是不能使用的
// 换句话说就是，数组在使用之前一定要进行初始化(其实就是分配存储空间)


/** 2、字典(Dictionary) */

// 字典的声明和初始化
let dict1: Dictionary<String, Int> = ["Liu": 1, "Guan": 2, "Zhang": 3]
let dict2: [String: Int] = ["Liu": 1, "Guan": 2, "Zhang": 3]
let dict3 = ["Liu": 1, "Guan": 2, "Zhang": 3]

print("--------- Dictiionary ---------")

// 空字典的声明和初始化
let dict4: Dictionary<String, Int> = Dictionary()
print(dict4.count)
let dict5 = Dictionary<String, Int>()
print(dict5.count)
let dict6: Dictionary<String, Int> = [:]
print(dict6.count)
let dict7 = [String: Int]()
print(dict7.count)


/** 3、集合(Set) */

// Set集合的声明和初始化
let set1: Set<String> = ["Liu", "Guan", "Zhang"]

print("--------- Set ---------")

// 空的Set集合的声明和初始化
let set2: Set<String> = []
print(set2.count)
let set3 = Set<String>()
print(set3.count)


/** 4、字符串集合(String) */

// 字符串类型String一开始就是集合类型，后来在Swift 2。0之后，它不再遵守CollectionType协议了，
// 这也就表明它被正式开除出集合类型了。但是到了Swift 4.0之后，它又被重新接纳到集合类型大家庭。因
// 此，只要是集合类型能用的属性或者方法，String类型几乎都能拿来使用

var name = "enrica"
name.append(" shi")
print(name)

for (idx, c) in name.enumerated() {
    print("\(c): \(idx)")
}


