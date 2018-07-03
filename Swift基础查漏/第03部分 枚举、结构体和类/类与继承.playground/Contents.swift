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


/** 1、构造函数的调用规则 */

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


/** 2、构造过程中的安全检查 */

// 在Swift中，类的构造过程主要分为两个阶段：
// - (1)、首先分配内存，初始化子类的存储属性，然后再网上逐步初始化父类的存储属性，直至全部父类的存储属性都初始化完毕;
// - (2)、从最顶层的父类逐步往下，对每一个类的存储属性按照相应的设置逐步修改，或者调用实例方法等等。


// Swift编译器在构造过程中会执行一些必要的安全检查，这些检查工作可以有效的防止属性在初始化完成之前被访问。同时，它也可
// 以有效的防止一些属性被另外一个构造函数意外赋予不符合预期的值。为了确保构造过程顺利完成，Swift提供了4中安全检查机制:
//
// - (1)、指定构造函数必须保证其所在类的所有属性都初始化完成之后，才可以向上调用父类的代理构造函数(也就是指定构造函数):
class Person {
    
    // 存储属性
    var name: String
    var age: Int
    
    // 自定义过早函数
    init(name: String, age: Int) {
        
        // 初始化成员属性
        self.name = name
        self.age = age
    }
}

class Student1: Person {
    
    // 存储属性
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // 先初始化自己的存储属性
        self.grade = grade
        
        // 再来调用父类的指定构造函数
        super.init(name: name, age: age)  // 向上调用父类的构造函数，也就是指定构造函数
    }
    
    convenience init(grade: Int) {
        self.init(name: "Jim", age: 18, grade: grade)  // 横向调用自己的构造函数，也就是便利构造函数
    }
}

// - (2)、在指定构造函数中，必须先向上调用父类的指定构造函数，然后才能为继承自父类的属性赋予新的值。否则，新设置的值
// 会被覆盖:
class Student2: Person {
    
    // 存储属性
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // ①、先初始化自己的存储属性
        self.grade = grade
        
        // ②、然后再调用父类的指定构造函数，初始化父类的存储属性
        super.init(name: name, age: age)
        
        // ③、最后才能为继承自父类的存储属性赋予新的值。注意，这一
        // 步如果和第②搞反了，那么新设置的值就会被覆盖掉
        self.name = "Lucy"
        self.age = 22
    }
}

// - (3)、便利构造函数必须先调用同一类型中的其它构造函数代理，然后才能为任意属性赋予新的值。否则，
// 新设置的值将会被同一类型中的其它指定构造函数所覆盖
class Student3: Person {
    
    // 存储属性
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // 先初始化自己的存储属性
        self.grade = grade
        
        // 再向上调用父类的指定构造函数，初始化父类的存储属性
        super.init(name: name, age: age)
    }
    
    // 便利构造函数
    convenience init(grade: Int) {
        
        // 先调用Student3中的其它构造函数
        self.init(name: "Lily", age: 19, grade: grade)
        
        // 然后才能为任意属性赋予新的值, 否则会被覆盖
        self.age = 22
    }
}

// - (4)、构造函数在所有的属性(包括继承自父类的存储属性)都被初始化之前，不能访问实例及其属性。因为，此时
// 属性未被初始化完成(紧扣之前所说的，属性未被初始化是不能访问的)
class Student4: Person {
    
    // 存储属性
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // ①、先初始化自己的存储属性
        self.grade = grade
        
        // ②、在第①步和第③步完成之前，这里是不能访问实例属性的
        // self.name = "Jimmy"
        
        // ③、再向上调用父类的指定构造函数，初始化父类的存储属性
        super.init(name: name, age: age)
    }
}
