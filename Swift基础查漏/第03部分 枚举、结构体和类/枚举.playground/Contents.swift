import UIKit

// 我们可能在其他编程语言中使用过枚举，但是，Swift的枚举一定会颠覆你
// 之前形成的观念。Swift语言中的枚举非常的强大，它具有面向对象的特性


/** 1、基本枚举 */

enum TextAlignment {
    case left
    case right
    case center
}

var alignment: TextAlignment = TextAlignment.left
alignment = .center


/** 2、原始值枚举 */

// 使用默认原始值
enum Weekday: Int {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

print("monday的原始值是: \(Weekday.monday.rawValue)")
print("tuesday的原始值是: \(Weekday.tuesday.rawValue)")
print("wednesday的原始值是: \(Weekday.wednesday.rawValue)")
print("thursday的原始值是: \(Weekday.thursday.rawValue)")
print("friday的原始值是: \(Weekday.friday.rawValue)")

// 使用指定原始值
enum Weekend: Int {
    case saturday = 30
    case sunday = 50
}

print("saturday的原始值是: \(Weekend.saturday.rawValue)")
print("sunday的原始值是: \(Weekend.sunday.rawValue)")

// 其实，在Swift中，原始值除了支持整型之外，它还支持其它所有类型
enum ProgrammingLanguage: String {
    case swift = "Swift"
    case java = "Java"
    case python = "Python"
    case ruby = "Ruby"
    case cpp = "C++"
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("我最喜欢的编程语言是: \(myFavoriteLanguage.rawValue)")


/** 3、方法 */

// 注意，在Swift中，方法是和具体的类型进行关联的函数。也就是说，方法的
// 本质还是函数，只不过它是一种特殊的函数，因为它不能脱离具体的类型而存在

enum Lightbulb {
    case on
    case off

    // 枚举内部的方法(因为这个函数是定义在枚举内部的方法，所以它是跟枚举类型Lightbulb类型相关联的方法)
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        
        // 灯泡表面的温度
        switch self {
            
        // 灯泡亮着的时候表面温度
        case .on:
            return ambient + 150.0
            
        // 灯泡熄灭的时候表面温度
        case .off:
            return ambient
        }
    }
    
    // 切换灯泡。因为枚举是值类型，在Swift中，值类型方法不能对self进行修改。如果
    // 确实需要修改，那么必须使用关键字mutating对该方法进行标记
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

// 打开灯泡
var bulb = Lightbulb.on
let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("现在这个灯泡表面的温度是: \(bulbTemperature)")

// 关闭灯泡
bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("现在灯泡表面的温度是: \(bulbTemperature)")
