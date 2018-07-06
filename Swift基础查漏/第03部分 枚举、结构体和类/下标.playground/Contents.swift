import UIKit

// 下标可以定义在类、结构体和枚举中，是访问集合、列表或序列中元素的快捷方式。可以使用下标的索引，
// 设置和获取值，而不需要再调用对应的存取方法。一个类型可以定义多个下标，通过不同索引类型进行重
// 载。下标不限于一维，你可以定义具有多个入参的下标满足自定义类型的需求

// 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。语法类似于实例
// 方法语法和计算型属性语法的混合。与定义实例方法类似，定义下标使用subscript关键字，指定一个或
// 多个输入参数和返回类型；与实例方法不同的是，下标可以设定为读写或只读。这种行为由getter和setter
// 实现，有点类似计算型属性：
/*
subscript(index: Int) -> Int {
    get {
        // 返回一个适当的 Int 类型的值
    }
    
    set(newValue) {
        // 执行适当的赋值操作
    }
}
*/

struct TimesTable {
    
    let multiplier: Int
    
    // 对于只读计算型属性，可以省略只读下标的get关键字
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("3 * 6 = \(threeTimesTable[6])")
