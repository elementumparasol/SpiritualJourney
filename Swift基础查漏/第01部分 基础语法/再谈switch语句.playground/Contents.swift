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
