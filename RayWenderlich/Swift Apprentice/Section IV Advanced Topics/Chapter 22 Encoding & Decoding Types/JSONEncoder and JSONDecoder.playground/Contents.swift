import UIKit

/**
 * 让自定义类型遵守Codable协议:
 * - 除了自身要遵守Codable协议之外，自定义类型
 * - 里面所有的存储属性也都需要遵守Codable协议
 */

struct Employee: Codable {
    
    // String和Int类型本身就已经遵守了Codable协议
    var name: String
    var id: Int
    
    // 现在只需要让favoriteToy属性也遵守Codable协议即可
    var favoriteToy: Toy?
}

struct Toy: Codable {
    
    var name: String
}

/**
 * 1、使用JSONEncoder进行编码(转化为JSONData的形式)
 */

let toy1 = Toy(name: "Teddy Bear")
let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)

let jsonEncoder = JSONEncoder()

// 因为encode(_ :)方法在执行时有可能会失败
// 并且会抛出一个错误，所以这里要使用try
let jsonData = try jsonEncoder.encode(employee1)

print(jsonData)

// 因为jsonData是一个不可读(从字面量上将)对象，如果你
// 希望打印结果看上去更加的友好，可以将jsonData转化为
// 字符串，这样看上去就比较容易从字面量上进行阅读了
let jsonString = String(data: jsonData, encoding: .utf8)!
print(jsonString)


