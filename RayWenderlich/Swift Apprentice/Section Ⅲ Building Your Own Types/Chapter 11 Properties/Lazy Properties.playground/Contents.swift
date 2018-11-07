//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct Circle {
    
    // 懒加载属性
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    
    // 存储属性
    var radius = 0.0
    
    // 计算属性
    var circumference: Double {
        
        mutating get {
            return pi * radius * 2
        }
    }
    
    // 自定义构造函数
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)

let circumference = circle.circumference
