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


/** 2、重写实例方法 */
class Person1 {
    
    // 存储属性
    var name: String
    var age: Int
    
    // 自定义构造函数
    init(name: String, age: Int) {
        
        // 初始化成员属性
        self.name = name
        self.age = age
    }
    
    // 自定义实例方法
    func description() -> String {
        return "\(name)现在的年龄是: \(age)"
    }
}

class Student1: Person1 {
    
    // 成员变量
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // 先初始化自己的成员变量
        self.grade = grade
        
        // 再调用父类的指定构造函数，初始化父类的存储属性
        super.init(name: name, age: age)
    }
    
    // 重写父类的实例方法
    override func description() -> String {
        return "\(name)现在的年龄是: \(age), 所在的年级是: \(grade)"
    }
}

let s = Student1(name: "Jimmy", age: 12, grade: 6)
print(s.description())


/** 3、final关键字 */

// 可以在类的定义过程中使用final关键字来修饰类、属性、方法和下标。被关键字final修饰的类
// 不能够被继承，被final关键字修饰的属性、方法和下标不能被重写

final class James {
    
    // 存储属性
    final var name: String = "LeBron James"
    var age: Int = 34
    
    final func description() -> String {
        return "James已经口头承诺加盟洛杉矶湖人"
    }
}

// 像James这个类因为被final修饰，所以就不能够被继承。并且，属性name和
// 方法description()也因为被关键字final修饰，因此也不能被重写
