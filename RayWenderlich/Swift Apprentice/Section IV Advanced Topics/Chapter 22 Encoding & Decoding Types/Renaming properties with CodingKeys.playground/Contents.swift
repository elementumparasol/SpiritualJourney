import UIKit

struct Employee: Codable {
    
    var name: String
    var id: Int
    var favoriteToy: Toy?
    
    // 定义一个嵌套类型CodingKeys枚举
    // 并且该枚举遵守CodingKey协议
    enum CodingKeys: String, CodingKey {
        
        // 注意，即便是不会将所有的属性进行重新命名
        // 我们也需要将所有的属性都包含在这个枚举中
        case id = "employeeId"
        case name
        case favoriteToy
    }
}

struct Toy: Codable {
    
    var name: String
}

// 创建Toy和Employee实例
let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "Jim Green", id: 7, favoriteToy: toy)

/**
 * 使用JSONEncoder进行编码
 */

// 创建编码器
let jsonEncoder = JSONEncoder()

// 调用encode(_ :)方法对employee进行编码
let jsonData = try jsonEncoder.encode(employee)

// 将jsonData转换为易于阅读的样式
let jsonString = String(data: jsonData, encoding: .utf8)!

print(jsonString)
// {"name":"Jim Green","favoriteToy":{"name":"Teddy Bear"},"employeeId":7}

print("\n--- 分割线 ---\n")



/**
 * 使用JSONDecoder进行解码
 */

// 创建解码器
let jsonDecoder = JSONDecoder()

// 对jsonData进行解码
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)

print(employee2)
// Employee(name: "Jim Green", id: 7,
// favoriteToy: Optional(__lldb_expr_29.Toy(name: "Teddy Bear")))

