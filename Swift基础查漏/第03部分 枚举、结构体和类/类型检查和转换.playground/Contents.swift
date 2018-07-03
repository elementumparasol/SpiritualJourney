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
