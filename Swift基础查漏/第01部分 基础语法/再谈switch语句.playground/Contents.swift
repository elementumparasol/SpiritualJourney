import UIKit

// switch 语句会尝试把某个值与若干个模式（pattern）进行匹配。根据第一个匹配成功的模式，switch 语句会执行对应的代码。
// switch 语句必须是完备的。这就是说，每一个可能的值都必须至少有一个 case 分支与之对应。在某些不可能涵盖所有值的情况
// 下，你可以使用默认（default）分支来涵盖其它所有没有对应的值，这个默认分支必须在 switch 语句的最后面


/** 1、区间匹配 */

// case分支的模式也可以是一个值的区间。下面的例子展示了如何使用区间匹配来输出任意数字对应的自然语言格式
let scroe = 62
var result = ""
switch scroe {
case 0..<60:
    result = "不及格"
case 60..<70:
    result = "及格"
case 70..<80:
    result = "良"
case 80..<90:
    result = "优秀"
case 90...100:
    result = "非常好"
default:  // default分支是不可少的
    result = "数据错误"
}

print("最终的等级是: \(result)")


/** 2、元组 */

// 除了区间匹配之外，我们还可以使用一个元组来在同一个switch中测试多个值
let somePoint = (1, 5)
switch somePoint {
case (0, 0):
    print("\(somePoint)在坐标原点")
case (_, 0):
    print("\(somePoint)在x轴上")
case (0, _):
    print("\(somePoint)在y轴上")
case (-2...2, -2...2):
    print("\(somePoint)在划定的区间内")
default:
    print("\(somePoint)在划定的区间之外")
}


/** 3、值绑定 */

// case分支允许将匹配的值声明为临时常量或变量，并且在case分支体内使用 —— 这种行为被称为
// 值绑定(value binding)，因为匹配的值在case分支体内，与临时的常量或变量绑定。下面的例
// 子将下图中的点(x, y)，使用(Int, Int)类型的元组表示，然后分类表示

let anotherPoint = (2, 5)

switch anotherPoint {
case (let x, 0):  // 绑定到临时变量x上
    print("只有x轴上有值，并且x的值为: \(x)")
    
case (0, let y):  // 绑定到临时变量y上
    print("只有y轴上有值，并且y的值为: \(y)")
    
case let (x, y):  // 绑定到临时变量x和y上
    print("x和y值都存在，分别为: (\(x), \(y))")
}

// 因为anotherPoint的坐标是(2, 5)，所以他会被绑定到


/** 4、where条件筛选 */

let yetAnotherPoint = (-1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("点(\(x), \(y))在x == y这条线上")
    
case let (x, y) where x == -y:
    print("点(\(x), \(y))在x == -y这条线上")
    
case let (x, y):
    print("点(\(x), \(y))不在x == y和x == -y这任意两条线上")
}
