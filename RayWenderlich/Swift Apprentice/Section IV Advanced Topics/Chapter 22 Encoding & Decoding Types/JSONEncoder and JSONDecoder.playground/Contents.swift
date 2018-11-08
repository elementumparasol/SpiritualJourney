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

print("--- 1、使用JSONEncoder进行编码(转化为JSONData的形式) ---")

// 创建Toy和Employee实例
let toy1 = Toy(name: "Teddy Bear")
let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)

// 创建编码器
let jsonEncoder = JSONEncoder()

// 因为encode(_ :)方法在执行时有可能会失败
// 并且会抛出一个错误，所以这里要使用try
let jsonData = try jsonEncoder.encode(employee1)

print(jsonData)  // 68 bytes

// 因为jsonData是一个不可读(从字面量上将)对象，如果你
// 希望打印结果看上去更加的友好，可以将jsonData转化为
// 字符串，这样看上去就比较容易从字面量上进行阅读了
let jsonString = String(data: jsonData, encoding: .utf8)!
print(jsonString)
// {"name":"John Appleseed","id":7,
// "favoriteToy":{"name":"Teddy Bear"}}


/**
 * 2、使用JSONDecoder进行解码(将JSONData转换为字符串)
 */

print("\n--- 2、使用JSONDecoder进行解码(将JSONData转换为字符串) ---")

// 创建解码器
let jsonDecoder = JSONDecoder()

// 使用Employee.self告诉decode(_ :, from:)要解码什么类型
// 即，我们这里告诉它要解码Employee这个类型
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)

print(employee2)
// Employee(name: "John Appleseed", id: 7,
// favoriteToy: Optional(__lldb_expr_27.Toy(name: "Teddy Bear")))
