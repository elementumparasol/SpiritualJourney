import UIKit

// 结构体是把相关数据块组合在一起放在内存中的一种类型。当我们需要把数据组合成
// 一种通用的类型时，就可以使用结构体。另外，结构体是值类型，而类是引用类型
// 结构体中一旦定义了相关属性，它就会默认生成的对应的init方法，但是类不是。


struct Student {
    var name: String = ""
    var age: Int = 0
    var height: Double = 0
}

// 结构体类型会根据声明的属性自动生成相应的构造方法
let stu = Student(name: "Jim", age: 20, height: 1.71)  // 值类型，使用let修饰不可在修改
print("stu.name = \(stu.name), stu.age = \(stu.age), stu.height = \(stu.height)")

class Person {
    var name: String
    var age: Int
    var height: Double
    
    init(name: String, age: Int, height: Double) {
        
        // 先对私有属性进行初始化
        self.name = name
        self.age = age
        self.height = height
        
        // 初始化完成之后，可以在这后面进行使用(处理其它数据)
    }
}

// 在调用手动创建的init构造方法对Person实例进行初始化时，会先对实例
// 进行相应的初始化。未被初始化的实例是不能使用的(不知道该为其分配多少存储空间)
let p = Person(name: "Lucy", age: 19, height: 1.61)  // 在创建实例的同时对其进行初始化
print("p.name = \(p.name), p.age = \(p.age), p.height = \(p.height)")
p.height = 1.65  // 引用类型，使用let修饰也可以修改
print("p.name = \(p.name), p.age = \(p.age), p.height = \(p.height)")
