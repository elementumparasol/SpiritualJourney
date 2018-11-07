import UIKit

/**
 * 1、让自定义类型遵守Codable协议:
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
