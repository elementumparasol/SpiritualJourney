//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/** 1、存储属性 */

struct Car {
    let make: String
    let color: String
}

/**
 * 像上面那样，make和color就是结构体Car的属性。结构体的属性既可以
 * 使用关键字let修饰，又可以使用关键字var来修饰，具体使用按个关键字
 * 要看实际需求。
 * 另外，属性make和color都是存储属性，也就是说，它们实际上是用来存
 * 储String类型的数据的。
 */


struct Contact {
    var fullName: String
    var emailAddress: String
}

// 注意，在结构体类型中，如果没有明确定义构造函数，那么系统会根据你提供
// 的属性自动生成相应的构造函数
var person = Contact(fullName: "enrica", emailAddress: "enrica@163.com")
let pName = person.fullName
let pAddress = person.emailAddress
print(pName)
print(pAddress)

person.fullName = "james"
let james = person.fullName
print(james)

/**
 * 说明：如果你不希望结构体中的属性被修改，可以使用关键字let来修饰它
 */
