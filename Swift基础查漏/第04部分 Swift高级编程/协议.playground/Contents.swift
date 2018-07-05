import UIKit

/** 1、协议实例方法 */

// 在Swift，类、结构体和枚举都能遵守一个或者多个协议，并且需要实现该协议所要求的属性或者方法
// 另外，如果限定该协议只能被类遵守，不能被结构体和枚举遵守，那么就只需要让该协议遵守class

protocol Walk: class {  // 限定Walk这个协议只能被类遵守
    
    func walking()
}

class Cat: Walk {
    
    // 遵守Walk协议，实现协议中的方法
    func walking() {
        print("猫行走的时候声音非常轻")
    }
}

class Dog: Walk {
    
    // 遵守Walk协议，实现协议中的方法
    func walking() {
        print("狗子走路的时候非常欢快")
    }
}

let cat = Cat()
cat.walking()

let dog = Dog()
dog.walking()


