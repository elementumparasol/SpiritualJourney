import UIKit

// 子类继承父类的属性、方法、下标等特征之后，可以按照实际要求对这些特征进行重写


/** 1、重写实例属性 */

// 对于存储属性而言，我们可以重写它的setter和getter访问器，也可以重写这个属性的观察者
// 但是，有一点需要注意，对于一个存储属性而言，如果我们重写了它的观察者，那么就不能再重写
// 它的setter和getter访问器，反之亦然(也就说，一个属性只能被重写一次)。另外，常量属性
// 和只读属性是不能被重写的
class Person {
    
    // 存储属性
    var name: String
    var age: Int
    
    // 自定义构造函数
    init(name: String, age: Int) {
        
        // 初始化存储属性
        self.name = name
        self.age = age
    }
}

class Student: Person {
    
    // 存储属性
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // 先初始化自己的存储属性
        self.grade = grade
        
        // 然后再调用父类的指定构造函数，初始化父类的属性
        super.init(name: name, age: age)
    }
    
    // 重写属性的setter和getter访问器
    override var age: Int {
        
        // 注意: 从重写过程来看，子类本身是不存储数据的，数据存储在父类的对应属性中
        
        get {
            
            // 直接访问父类的age属性
            return super.age
        }
        
        set {
            
            // 重新给父类的age属性赋值
            super.age = newValue < 18 ? 18 : newValue
        }
    }
    
    // 重写属性观察者
    override var name: String {
        
        willSet {
            print("名字的新值: \(newValue)")
        }
        
        didSet {
            print("名字的旧值: \(oldValue)")
        }
    }
}
