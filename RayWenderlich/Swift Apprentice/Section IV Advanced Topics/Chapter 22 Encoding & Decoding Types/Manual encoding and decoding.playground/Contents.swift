import UIKit

struct Toy: Codable {
    
    var name: String
}

struct Employee {
    
    var name: String
    var id: Int
    var favoriteToy: Toy?
    
    enum CodingKeys: String, CodingKey {
        
        // 对存储属性id进行重命名
        case id = "employeeId"
        case name
        
        // 这里枚举成员gift应该对应上面的favoriteToy属性
        case gift
    }
}

// MARK: - 遵守Encodable协议，手动进行编码
extension Employee: Encodable {
    
    // 实现encode(to：Encoder)方法，并且描述如何对每个属性进行编码
    func encode(to encoder: Encoder) throws {
        
        // 在正式进行编码之前，我们需要先取出编码容器
        // container(keyedBy: )方法接收一个表示
        // 类型的参数，并且返回encoder容器
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // 通过编码容器调用encode(_ :, forKey: )方法
        // 使用指定的键来对指定的值进行编码
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        // try container.encode(favoriteToy?.name, forKey: .gift)
        
        // 因为favoriteToy是可选类型，所以如果它没有值的话，在进行编码时可能会
        // 出现 {"name":"Jim Green","gift":null,"employeeId":7} 这种
        // 情况。所以，为了在编码剔除掉没有的值，我们可以进行下面这样处理
        try container.encodeIfPresent(favoriteToy?.name, forKey: .gift)
    }
}

// MARK: - 遵守Decodable协议，手动进行解码
extension Employee: Decodable {
    
    // 使用指定的解码器来创建新的解码器实例
    init(from decoder: Decoder) throws {
        
        // 返回存储在解码器中的数据
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // 通过指定的键来解码指定类型的值
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        
        // 因为favoriteToy是可选类型，所以这里需要进行可选绑定
        /*if let gift = try values.decode(String?.self, forKey: .gift) {
            favoriteToy = Toy(name: gift)
        }*/
        
        // 和编码一样，在解码时，对可选类型最好是特殊处理
        if let gift = try values.decodeIfPresent(String.self, forKey: .gift) {
            favoriteToy = Toy(name: gift)
        }
    }
}


/**
 * 使用JSONEncoder来进行编码
 */

// 创建Toy和Employee实例
let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "Jim Green", id: 7, favoriteToy: nil)

// 创建编码器
let jsonEncoder = JSONEncoder()

// 对employee进行编码
let jsonData = try jsonEncoder.encode(employee)

print(jsonData)

// 将jsonData转换为易于阅读的字符串类型
let jsonString = String(data: jsonData, encoding: .utf8)!
print(jsonString)
// {"name":"Jim Green","employeeId":7}

/**
 * 使用JSONDecoder来进行解码
 */

// 创建解码器
let jsonDecoder = JSONDecoder()

// 对jsonData进行解码
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)
print(employee2)
// Employee(name: "Jim Green", id: 7, favoriteToy: nil)
