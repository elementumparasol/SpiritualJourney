import UIKit

/** 1、使用is进行类型检查 */

class Person {
    
    // 存储属性
    var name: String
    var age: Int
    
    // 自定义构造函数
    init(name: String, age: Int) {
        
        // 初始化自己的存储属性
        self.name = name
        self.age = age
    }
}

class Teacher: Person {
    
    // 存储属性
    var course: String
    
    // 自定义构造函数
    init(name: String, age: Int, course: String) {
        
        // 初始化自己的存储属性
        self.course = course
        
        // 调用父类的指定构造函数，初始化父类的存储属性
        super.init(name: name, age: age)
    }
}

class Student: Person {
    
    // 存储属性
    var grade: Int
    
    // 自定义构造函数
    init(name: String, age: Int, grade: Int) {
        
        // 初始化自己的存储属性
        self.grade = grade
        
        // 调用父类的指定构造函数，初始化父类的存储属性
        super.init(name: name, age: age)
    }
}

// 创建多个实例
let s1 = Student(name: "Jim", age: 12, grade: 6)
let s2 = Student(name: "Tom", age: 11, grade: 6)
let s3 = Student(name: "Lily", age: 7, grade: 2)
let t1 = Teacher(name: "Mark", age: 25, course: "Math")
let t2 = Teacher(name: "Dannie", age: 28, course: "English")

// 创建数组，将这些实例存放到数组中
let person = [s1, t1, s3, s2, t2]

// 遍历数组person，取出里面的元素
for item in person {
    
    // 使用is检查item的真实类型是否为Student
    if item is Student {
        print("\(item.name)是一名学生")
    }
    
    // 使用is检查item的真实类型是否为Teacher
    else if item is Teacher {
        print("\(item.name)是一名老师")
    }
}


/** 2、使用as、as!和as?进行对象类型转换 */

// 在进行对象类型转换之前，首先必须先明确一点，并不是所有的对象类型都能相互转换。对象
// 类型的转换必须要建立在继承的基础之上的，这个跟强制类型转换还是有很大区别的。其次，
// 对象类型转换主要放生在两个方向上，即父类转换成子类，以及子类转换为父类。通常情况下
// 对象类型转换以父类转换为子类较多，而将子类转换为父类的情况比较少见

// (1)as操作符: 主要用于将子类转换为父类这种场合(也就是向上转换)，比较少见
let student = Student(name: "Lucy", age: 12, grade: 6)

// 通过as操作符将其转换为Person类型
let p = student as Person  // 使用as操作符，强制将子类转换为父类

// (2)as!操作符: 主要是用来在对象类型的转换过程中，对可选值进行隐式拆包，最后转换的结
// 果是非可选类型。as!操作符的使用主要有两种情况: ①、将非可选类型转换为非可选类型;②、
// 将可选类型转换为非可选类型。总之，经过as!转换过后的类型都是非可选类型
let p1 = Person(name: "Tom", age: 12)
let stu = p1 as! Student  // 使用as!操作符，将父类转换为子类

// (3)as?操作符在对象类型的转换过程中，不执行解包操作，转换之后的结果仍然是可选类型。
// as?的应用场合主要有两方面: ①、将非可选类型转换为可选类型; ②、将可选类型转换为可
// 选类型
let p2: Person? = Student(name: "July", age: 10, grade: 5)
let stu2 = p2 as? Student


/** 3、AnyObject和Any */
// 在Swift中，有两种类型用来表示不确定类型，即AnyObject和Any。其中，AnyObject主要
// 是用来表示类的任何类型，也就是引用类型；而Any则是用来表示任何类型，除了类对象之外，
// 还可以用来表示Int、Double这一类的基本类型，也就是说Any除了可以表示引用类型之外，也
// 可以用来表示值类型
// Swift provides two special types for working with nonspecific types:
// - Any can represent an instance of any type at all, including function types.
// - AnyObject can represent an instance of any class type.
