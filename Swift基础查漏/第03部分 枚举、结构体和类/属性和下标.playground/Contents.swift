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
