import UIKit


// Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：
// 弱引用（weak reference）和无主引用（unowned reference）。弱引用
// 和无主引用允许循环引用中的一个实例引用而另外一个实例不保持强引用。这样
// 实例能够互相引用而不产生循环强引用。

// 那么，什么时候使用弱引用，什么时候使用无助引用呢？主要是遵循以下原则:
// - 当其他的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构
//   在先时。
// - 相比之下，当其他实例有相同的或者更长生命周期时，请使用无主引用。

/** 1、弱引用 */

// 弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。
// 这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上 weak
// 关键字表明这是一个弱引用。

class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    // 强引用
    var apartment: Apartment?
    
    deinit {
        print("\(name)被销毁了")
    }
}

class Apartment {
    
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    // 弱引用
    weak var tenant: Person?
    
    deinit {
        print("\(unit)被销毁了")
    }
}

var p: Person?
var apt: Apartment?

p = Person(name: "James")
apt = Apartment(unit: "Zhengli Rd.")

p?.apartment = apt  // James拥有这套公寓
apt?.tenant = p  // 公寓的主人是James

p = nil
apt = nil
