import UIKit

// 初始化是设置类型(主要指结构体、枚举和类这三种类型)实例的操作，包括给每个存储
// 属性赋初始值，以及一些其他准备工作。只有在完成初始化工作之后，这个实例才能使用
//
// 初始化方法用关键字init表示，并且，初始化方法是一个前面没有func关键字的类型方法
// 初始化方法可以没有参数，可以有一个参数，也可以有多个参数，具体参数情况根据实际需
// 要来设置。跟方法所不同的是，初始化方法没有返回值。初始化方法的任务是给类型的存储
// 属性赋初始值
//
// 不管是结构体还是类，只要是它们的成员属性都有默认的值，并且没有自定义的构造函数，那
// 么，Swift就会自动给它们提供一个默认的构造函数init()。一旦我们自定义了构造函数，
// 那么，Swift就会不再提供默认的构造函数init()。但是，如果你仍然怀念默认构造器，希
// 望默认构造器、逐一成员构造器和自定义构造器都能同时使用，可以选择将自定义构造方法写
// 到类型的extension中


/** 1、结构体的初始化方法 */

// 结构体既可以有默认的初始化方法，也可以有自定义的初始化方法
struct People {
    
    // 存储属性
    var name: String = ""
    var age: Int = 0
    var height: Double = 0
    
    // 如果不用自定义初始化方法，那么系统可以根据成员变量自动生成
}

// 创建结构体实例
var p1 = People()
p1.name = "Jimmy"
p1.age = 20
p1.height = 1.74
print("p1.name = \(p1.name), p1.age = \(p1.age), p1.height = \(p1.height)")

// 使用结构体根据成员变量自动生成的初始化方法
var p2 = People(name: "Lucy", age: 19, height: 1.62)
print("p2.name = \(p2.name), p2.age = \(p2.age), p2.height = \(p2.height)")

// 结构体中自定义初始化方法
struct Student {
    
    // 虽然这里是常量，但是我们依然还是可以在后面的init方法中给它赋值
    // 记住：初始化的目的是确保类型的属性在初始化完成之后有值。没有被
    // 初始化过的常量或者变量都是不可以用的。并且，常量一旦初始化过后，
    // 它的值是不可以更改的。因此，虽然这里是常量，我们依然可以在后面
    // 的初始化方法中给它赋值
    let name: String
    var age: Int
    var height: Double
    
    // 自定义初始化方法
    init(name: String, age: Int, height: Double) {
        
        // 给成员变量赋值
        self.name = name
        self.age = age
        self.height = height
    }
}

var s1 = Student(name: "Lily", age: 22, height: 1.73)
print("s1.name = \(s1.name), s1.age = \(s1.age), s1.height = \(s1.height)")

struct Cat {
    
    // 存储属性
    var name: String
    var feet: Int
    
    // 构造函数
    init() {  // 不带参数的构造函数
        
        // 对成员变量进行初始化
        name = "小花"
        feet = 4
    }
    
    // 带参数的默认构造函数
    init(name: String, feet: Int) {
        
        // 对成员变量进行初始化
        self.name = name
        self.feet = feet
    }
}

// 因为自定义了构造函数，那么系统就不会生成默认的构造函数
// 并且，调用这个构造函数创建的对象，其属性都有默认值
let cat = Cat()
print("cat.name = \(cat.name), cat.feet = \(cat.feet)")

let aCat = Cat(name: "花猫", feet: 4)

// 对于结构体而言，如果没有特别的需要，最好是不要自定义初始化方法
// 使用根据结构体成员变量自动生成的初始化方法反而更加方便和灵活


/** 2、结构体的委托初始化方法(又叫代理构造函数) */

// 在初始化方法(即构造函数)中，可以包含对该类型其它初始化方法(构造函数)的调用，
// 这个过程被称之为委托初始化方法，或者说代理构造函数。又因为结构体是不能继承的
// 因此，结构体的代理构造函数只能发生在统一类型结构体的内部，也就是只能横向代理
// 像这种发生在同一类型内部的代理构造函数，我们通常称之为便利构造函数(convenience initializer)
struct Person {
    
    var name: String
    var age: Int
    var height: Double
    
    // 自定义构造函数
    init(name: String, age: Int, height: Double) {
        
        // 对成员变量进行初始化
        self.name = name
        self.age = age
        self.height = height
    }
    
    // 这个就可以称之为代理构造函数
    init(name: String, age: Int) {
        
        // 这里调用上一个构造函数
        self.init(name: name, age: age, height: 1.77)
    }
}

let p = Person(name: "James", age: 18)
print("p.name = \(p.name), p.age = \(p.age), p.height = \(p.height)")


/** 3、类的初始化方法和指定初始化方法 */

// 因为与结构体所不同的是，类是可以继承的，因此它的初始化方法肯定比结构体要复杂得多
// 在上面我们说过，在同一个类型中，在一个初始化方法(或者说构造函数)中调用另一个初始
// 化(或构造函数)的做法叫做委托(代理)初始化，或者说叫做便利初始化、便利构造函数。这
// 个便利构造函数的概念在类中也是存在的。但是，除此之外，由于类具有继承性，因此在类
// 这种类型中，还有另外一种操作: 指定初始化方法(designated initializer,即指定构造函数)
//
// 所谓的指定构造函数，就是指在子类中先调用父类的过早函数，初始化完父类的存储属性，然后
// 在类完成自己内部的事情，这种构造函数就叫做指定构造函数，或者说指定初始化方法。在实际
// 开发过程中用得最多的就是指定构造函数，因此这个一定要掌握
//
// 类的默认初始化方法: 如果某一个类的属性都有默认的初始值，并且没有定义任何初始化方法，
// 那么，这个类将会得到一个默认的空初始化方法(即init() {}这种形式)。必须注意的是，和
// 结构体所不同的是，类里面没有默认的成员初始化方法，也就是说，如果在一个类中，定义了若
// 干存储属性，并且给这些成员属性设置了初始值，但是没有定义成员初始化方法，类是不会根据
// 成员属性自动生成默认的成员初始化方法，这一点跟结构体有很大的区别！

class Animal {
    
    // 有成员属性，并且成员属性有默认的初始值
    var name: String = ""
    var feet: Int = 0
    
    // 没有定义成员初始化方法，类是不会根据成员属性自动生成成员初始化方法的
}

// 创建Animal实例
let animal = Animal()

// 修改Animal实例对象的属性
animal.name = "dog"
animal.feet = 4


class Dog {
    
    // 有成员属性，但是没有被初始化
    var name: String
    var feet: Int
    
    // 自定义成员初始化方法
    init(name: String, feet: Int) {
        
        // 给成员属性赋值(初始化成员属性)
        self.name = name
        self.feet = feet
    }
}

// 创建Dog实例，并且同时对Dog实例中的属性进行初始化
let dog = Dog(name: "旺财", feet: 4)

class Pomeranian: Dog {
    
    // 存储属性
    var hairColor: UIColor
    
    // 自定义的初始化方法
    init(hairColor: UIColor, name: String, feet: Int) {
        
        // 先初始化自己的属性
        self.hairColor = hairColor
        
        // 调用父类的初始化方法来初始化父类的属性(指定初始化方法)
        super.init(name: name, feet: feet)
    }
    
    // 便利构造函数(仅作为演示)
    convenience init(hairColor: UIColor) {
        
        // 调用自己内部的构造函数
        self.init(hairColor: hairColor, name: "名称", feet: 4)
    }
}

let pomer = Pomeranian(hairColor: .white, name: "布丁", feet: 4)
