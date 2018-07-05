import UIKit

/** 1、闭区间 */

// 闭区间运算符(a...b)定义一个包含从a到b(包括a和b)的所有值的区间。a的值不能超过b
for i in 1...5 {
    print("i = \(i)")
}


/** 2、半开区间 */

// 半开区间运算符(a..<b)定义一个从a到b但不包括b的区间。之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值
for x in 1..<5 {
    print("x = \(x)")
}


/** 3、单侧区间 */

let names = ["关羽", "张飞", "赵云", "马超", "黄忠"]

for (idx, name) in names[...2].enumerated() {
    print("\(idx): \(name)")
}

for (idx, name) in names[..<2].enumerated() {
    print("\(name): \(idx)")
}

for (idx, name) in names[2...].enumerated() {
    print("\(idx): \(name)")
}
// 注意，单侧区间里没有>..，比如说，像names[2>..]就是错误的
