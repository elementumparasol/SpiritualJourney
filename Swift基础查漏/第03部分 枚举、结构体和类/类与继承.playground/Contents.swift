import UIKit

// 继承是面向对象的重要特征。在Swift中，虽然结构体和枚举这两种类型也具有面向对象的部分特性。但是，
// 和其它编程语言一样，Swift中的继承只能发生在类上，不能发生在结构体和枚举这两种类型上

class Human {
    
    // 存储属性
    var skinColor: String
    
    // 构造函数
    init(skinColor: String) {
        
        // 初始化成员属性
        self.skinColor = skinColor
    }
}


/** 1、构造函数的继承和调用规则 */

class Student: Human {
    
    // 成员属性
    var name: String
    var age: Int
    var height: Double
    
    // 自定义构造函数(子类中的自定有构造函数必须在最后调用父类的指定构造函数)
    init(skinColor: String, name: String, age: Int, height: Double) {
        
        // 初始化自己的成员属性
        self.name = name
        self.age = age
        self.height = height
        
        // 调用父类的指定构造函数初始化父类的成员属性
        super.init(skinColor: skinColor)
    }
    
    // 便利构造函数(便利构造函数必须调用同类型中的其它构造函数)
    convenience init(name: String, age: Int, height: Double) {
        
        // 初始化自己的成员属性
        self.init(skinColor: "黄色", name: name, age: age, height: height)
    }
    
    // 重写父类的构造函数
    convenience override init(skinColor: String) {
        
        // 调用自己的便利构造函数以减少重复的代码
        self.init(skinColor: skinColor, name: "Jimmy", age: 18, height: 1.61)
    }
}

let s = Student(skinColor: "黄色")
print("s.skinColor = \(s.skinColor)")

let s1 = Student(skinColor: "黑色", name: "Lucy", age: 19, height: 1.63)
print("s1.skinColor = \(s1.skinColor)")

let s2 = Student(name: "Lily", age: 20, height: 1.64)
print("s2.skinColor = \(s2.skinColor)")

// 总结:
// - (1)、自定义构造函数的最后必须调用其直接父类的指定构造函数；
// - (2)、便利构造函数必须调用同类型中的其它构造函数；
// - (3)、便利构造函数最后必须调用指定构造函数结束。
