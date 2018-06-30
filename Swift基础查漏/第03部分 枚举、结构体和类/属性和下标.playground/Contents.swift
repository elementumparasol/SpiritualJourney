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


/** 2、懒加载属性(延迟属性或者惰性属性) */

// 有时候出于性能方面的考虑，我们并不需要马上给属性赋值，在此情况下，就需要用到懒加载属性了
// 懒加载属性可以做到在使用时才加载，它能有效减少当前内存和时间的消耗。
// 懒加载属性可以确保该属性值只在第一次访问的时候才会出现。这种延迟技术可以把属性值的计算延
// 迟到实例初始化之后。这就意味着链家在属性必须使用var来声明，因为该属性的值在稍后会发生改变
// 懒加载属性使用关键字lazy进行标记

struct Department {
    
    var deptName: String = ""
    var deptNum: Int = 0
}

class Employee {
    
    var name: String = ""
    var age: Int = 0
    var job: String?
    var salary: Double = 0
    
    // 懒加载属性
    lazy var dept: Department = Department()
}


/** 3、计算属性 */

// 计算属性不仅可以用在结构体和类中，也可以用在枚举里面。与存储属性所不同的是，计算属性
// 并不存储任何数据，它只承担计算功能————也就是说，计算属性只负责从其它属性中读取数据，
// 然后再进行相应的计算。计算属性提供一个Getter访问器来从其它属性中读取数据，另外再提供
// 一个可选Setter访问器来对读取的数据进行相应的计算

struct Point {
    
    var x = 0.0
    var y = 0.0
}

struct Size {
    
    var width = 0.0
    var height = 0.0
}

struct Rect {
    
    // 存储属性
    var origin = Point()
    var size = Size()
    
    // 计算属性
    var center: Point {
        
        // 从存储属性origin和size中读取数据
        get {
            let centerX = origin.x + size.width * 0.5
            let centerY = origin.y + size.height * 0.5
            return Point(x: centerX, y: centerY)
        }
        
        // 重新设置存储属性origin的值
        set {
            origin.x = newValue.x - size.width * 0.5
            origin.y = newValue.y - size.height * 0.5
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
let initialSquareCenter = square.center

square.center = Point(x: 15, y: 15)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


/** 4、属性观察者(属性监听) */

// 属性监听者可以监听存储属性前后的变化，但是它不能监听常量属性和懒加载属性

class Student {
    
    // 属性监听器
    var name: String = "Tom" {
        
        willSet(newNameValue) {
            print("学生的新名字: \(newNameValue)")
        }
        
        didSet(oldNameValue) {
            print("学生原来的名字: \(oldNameValue)")
        }
    }
    
    // 存储属性
    var age: Int = 0
}

let s = Student()
s.age = 10
s.name = "Jim"
