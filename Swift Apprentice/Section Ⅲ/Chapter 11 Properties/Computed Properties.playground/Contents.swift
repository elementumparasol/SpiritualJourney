//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// While a stored property can be a constant or a variable, a computed
// property must be deﬁned as a variable.
// 存储属性既可以使用let修饰，又可以使用var修饰。但是，计算属性只能使用var修饰
// Computed properties must also include a type, because the compiler
// needs to know what to expect as a return value
// 另外，在声明计算属性是，还必须明确指定它的类型。因为编译器需要知道计算类型最终返回什么类型

struct TV {

    // 存储属性
    var height: Double
    var width: Double

    // 计算属性(返回Int类型)
    var diagonal: Int {
        
        // 计算对角线。squareRoot()函数是用来开方的，而rounded()函数是用来做四舍五入的
        // 上面这两个函数都返回Double类型的结果
        let result = (height * height + width * width).squareRoot().rounded()
        
        // 返回对角线
        return Int(result)
    }
}

var tv = TV(height: 53.93, width: 95.87)
let tvSize = tv.diagonal

tv.width = tv.height
let diagonal = tv.diagonal



/** 2、getter和setter */

struct TV2 {
    
    // 存储属性
    var height: Double
    var width: Double
    
    // 计算属性
    var diagonal: Int {
        
        // getter属性
        get {
            let result = (height * height + width * width).squareRoot().rounded()
            return Int(result)
        }
        
        // setter属性
        set {
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            
            let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv2 = TV2(height: 53.93, width: 95.87)
tv2.diagonal = 70
let height = tv2.height
let width = tv2.width

