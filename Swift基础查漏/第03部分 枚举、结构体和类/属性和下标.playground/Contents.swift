import UIKit

/** 1、存储属性 */


// 存储属性只适用于结构体和类，并不适用于枚举。存储属性是一种读写属性，我们
// 既可以给属性赋值(写)，也可以从属性中读取相应的数据(读)。当然，根据实际
// 需要，存储属性也可以是只读的(也就是常量)
struct People {
    
    // 结构体的存储属性
    var name: String = ""
    var age: Int = 0
    var height: Double = 0
}

class Person {
    
    // 类中的存储属性
    var name: String
    var age: Int
    var height: Double
    
    init(name: String, age: Int, height: Double) {
        
        // 在创建对象的同时，对类的存储属性进行初始化。初始化
        // 的实质是分配存储空间。没有初始化的属性是不能使用的
        self.name = name
        self.age = age
        self.height = height
    }
}
