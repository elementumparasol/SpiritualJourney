import Foundation

let json = """
{
    "manufacturer": "Cessna",
    "model": "Skyhawk",
    "seats": 4
}
""".data(using: .utf8)!

// 创建解码器
let decoder = JSONDecoder()

// 对json数据进行解码
let plane = try! decoder.decode(Plane.self, from: json)

// 检查解码效果
print(plane.manufacturer)  // Cessna
print(plane.model)  // Skyhawk
print(plane.seats)  // 4



// 创建编码器
let encoder = JSONEncoder()

// 使用编码器对数据进行编码
let reencodedJSON = try! encoder.encode(plane)

// 将reencodedJSON转换为易于阅读的样式
let jsonString = String(data: reencodedJSON, encoding: .utf8)!
print(jsonString)  // {"manufacturer":"Cessna","model":"Skyhawk","seats":4}
