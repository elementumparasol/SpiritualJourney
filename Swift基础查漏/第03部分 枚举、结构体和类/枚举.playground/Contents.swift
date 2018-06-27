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
