import UIKit

// 结构体是把相关数据块组合在一起放在内存中的一种类型。当我们需要把数据组合成
// 一种通用的类型时，就可以使用结构体。另外，结构体是值类型，而类是引用类型
// 结构体中一旦定义了相关属性，它就会默认生成的对应的init方法，但是类不是。


/** 1、结构体和类的基本使用 */


// 定义一个结构体类型
struct Student {
    var name: String = ""
    var age: Int = 0
    var height: Double = 0
}

// 结构体类型会根据声明的属性自动生成相应的构造方法
let stu = Student(name: "Jim", age: 20, height: 1.71)  // 值类型，使用let修饰不可在修改
print("stu.name = \(stu.name), stu.age = \(stu.age), stu.height = \(stu.height)")

// 定义一个类
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


/** 2、嵌套类型 */

// 所谓的嵌套类型，就是指在枚举、结构体或者类的花括号{}内部再定义一个枚举、结构体或者类

class People {
    
    // 普通的成员变量
    var name: String
    var age: Int
    var height: Double
    
    // 结构体成员变量
    var dept :Department
    
    // 枚举类型成员变量
    var day: Weekdays
    
    // 嵌套一个结构体
    struct Department {
        var deptName: String = ""
        var deptJob: String = ""
    }
    
    // 嵌套一个枚举
    enum Weekdays: String {
        case monday = "Mon."
        case tuesday = "Tue."
        case wednesday = "Wed."
        case thursday = "Thu."
        case friday = "Fri."
    }
    
    // 自定义构造函数
    init(name: String, age: Int, height: Double, dept: Department, day: Weekdays) {
        
        // 初始化私有成员变量
        self.name = name
        self.age = age
        self.height = height
        self.dept = dept
        self.day = day
    }
}

var dept = People.Department(deptName: "销售部", deptJob: "销售经理")
var day = People.Weekdays.monday
let peo = People(name: "James", age: 22, height: 1.83, dept: dept, day: day)
print("peo.name = \(peo.name), peo.age = \(peo.age), \(peo.height), peo.dept = \(peo.dept), peo.day = \(peo.day)")
