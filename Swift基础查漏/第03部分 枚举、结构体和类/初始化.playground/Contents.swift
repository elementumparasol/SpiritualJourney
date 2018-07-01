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
    
    // 虽然这里是常量，但是我们依然还是可以在后面的init方法中给它赋值
    // 记住：初始化的目的是确保类型的属性在初始化完成之后有值。没有被
    // 初始化过的常量或者变量都是不可以用的。并且，常量一旦初始化过后，
    // 它的值是不可以更改的。因此，虽然这里是常量，我们依然可以在后面
    // 的初始化方法中给它赋值
    let name: String
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


/** 2、结构体的委托初始化方法(又叫代理构造函数) */

// 在初始化方法(即构造函数)中，可以包含对该类型其它初始化方法(构造函数)的调用，
// 这个过程被称之为委托初始化方法，或者说代理构造函数。又因为结构体是不能继承的
// 因此，结构体的代理构造函数只能发生在统一类型结构体的内部，也就是只能横向代理
// 像这种发生在同一类型内部的代理构造函数，我们通常称之为便利构造函数(convenience initializer)
struct Person {
    
    var name: String
    var age: Int
    var height: Double
    
    // 自定义构造函数
    init(name: String, age: Int, height: Double) {
        
        // 对成员变量进行初始化
        self.name = name
        self.age = age
        self.height = height
    }
    
    // 这个就可以称之为代理构造函数
    init(name: String, age: Int) {
        
        // 这里调用上一个构造函数
        self.init(name: name, age: age, height: 1.77)
    }
}

let p = Person(name: "James", age: 18)
print("p.name = \(p.name), p.age = \(p.age), p.height = \(p.height)")
