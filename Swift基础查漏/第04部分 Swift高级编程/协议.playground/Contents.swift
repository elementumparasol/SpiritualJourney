import UIKit

/** 1、协议实例方法 */

// 在Swift，类、结构体和枚举都能遵守一个或者多个协议，并且需要实现该协议所要求的属性或者方法
// 另外，如果限定该协议只能被类遵守，不能被结构体和枚举遵守，那么就只需要让该协议遵守class

protocol Walk: class {  // 限定Walk这个协议只能被类遵守
    
    func walking()
}

class Cat: Walk {
    
    // 遵守Walk协议，实现协议中的方法
    func walking() {
        print("猫行走的时候声音非常轻")
    }
}

class Dog: Walk {
    
    // 遵守Walk协议，实现协议中的方法
    func walking() {
        print("狗子走路的时候非常欢快")
    }
}

let cat = Cat()
cat.walking()

let dog = Dog()
dog.walking()


/** 2、协议中的实例属性 */

protocol Person {
    
    var name: String { get set }
    var age: Int { get set }
    var height: Double { get set }
}

class Student: Person {
    
    // 遵守Person协议所需要实现的属性
    var name: String
    var age: Int
    var height: Double
    
    // 自己的存储属性
    var num: Int
    
    init(name: String, age: Int, height: Double, num: Int) {
        
        self.name = name
        self.age = age
        self.height = height
        self.num = num
    }
}

struct Teacher: Person {
    
    var name: String = ""
    var age: Int = 0
    var height: Double = 0
    
    var subject: String = "Math"
}

let s = Student(name: "James", age: 19, height: 1.73, num: 20180101)
let t = Teacher(name: "Tom", age: 36, height: 1.81, subject: "biology")

// 注意，协议作为类型使用的时候，基本上和其它类型没有太大区别，它不仅可以使用as、as?和as!
// 进行对象类型转换，还可以使用is操作符类判断某个类型是否有遵守某个协议
