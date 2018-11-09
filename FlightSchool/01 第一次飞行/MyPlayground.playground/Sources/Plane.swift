import Foundation

public struct Plane: Codable {
    
    // JSON数据的键属性
    public var manufacturer: String
    public var model: String
    public var seats: Int
    
    /**
     * 由于我们使用的JSON数据非常简单，并且JSON中的
     * 的键属性和CodingKeys中的成员变量一一对应，所
     * 以，下面的这些代码可以删除，系统会自动帮我们实现
     */

    // 我们在这里定义了一个CodingKeys的枚举，并且该枚举
    // 的原始类型为String，同时，该枚举声明为遵守CodingKey协议
    private enum CodingKeys: String, CodingKey {
        
        // 由于枚举的成员变量名称和JSON中的键相同，所以
        // 这里不需要为枚举的成员提供明确的原始值
        case manufacturer
        case model
        case seats
    }
    
    // 实现Decodable中的方法
    public init(from decoder: Decoder) throws {
        
        // 为了适应各种数据交换格式，需要获取解码容器。容器是用来存储
        // 值的，它可以存储一个值，也可以存储多个值，可以像字典一样由
        // 键去对应值，也可以像数组一样不需要键
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 用不同的键来解码各个属性
        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Int.self, forKey: .seats)
    }
    
    // 实现Encodable协议中的方法
    public func encode(to encoder: Encoder) throws {
        
        // 获取编码容器。因为需要用container填充编码器encoder的参数
        // 需要进行修改，因此这里要把它声明为var
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // 通过编码容器调用encode(_: forKey:)方法，传入属性值及其对应的键
        try container.encode(self.manufacturer, forKey: .manufacturer)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.seats, forKey: .seats)
    }
}


