import UIKit

// 初始化是设置类型(主要指结构体、枚举和类这三种类型)实例的操作，包括给每个存储
// 属性赋初始值，以及一些其他准备工作。只有在完成初始化工作之后，这个实例才能使用
//
// 初始化方法用关键字init表示，并且，初始化方法是一个前面没有func关键字的类型方法
// 初始化方法可以没有参数，可以有一个参数，也可以有多个参数，具体参数情况根据实际需
// 要来设置。跟方法所不同的是，初始化方法没有返回值。初始化方法的任务是给类型的存储
// 属性赋初始值。


/** 1、结构体的初始化方法 */

// 结构体既可以有默认的初始化方法，也可以有自定义的初始化方法
struct People {
    
    // 存储属性
    var name: String = ""
    var age: Int = 0
    var height: Double = 0
    
    // 如果不用自定义初始化方法，那么系统可以根据成员变量自动生成
}

// 创建结构体实例
var p1 = People()
p1.name = "Jimmy"
p1.age = 20
p1.height = 1.74
print("p1.name = \(p1.name), p1.age = \(p1.age), p1.height = \(p1.height)")

// 使用结构体根据成员变量自动生成的初始化方法
var p2 = People(name: "Lucy", age: 19, height: 1.62)
print("p2.name = \(p2.name), p2.age = \(p2.age), p2.height = \(p2.height)")

// 结构体中自定义初始化方法
struct Student {
    
    // 存储属性
    var name: String
    var age: Int
    var height: Double
    
    // 自定义初始化方法
    init(name: String, age: Int, height: Double) {
        
        // 给成员变量赋值
        self.name = name
        self.age = age
        self.height = height
    }
}

var s1 = Student(name: "Lily", age: 22, height: 1.73)
print("s1.name = \(s1.name), s1.age = \(s1.age), s1.height = \(s1.height)")

// 对于结构体而言，如果没有特别的需要，最好是不要自定义初始化方法
// 使用根据结构体成员变量自动生成的初始化方法反而更加方便和灵活
