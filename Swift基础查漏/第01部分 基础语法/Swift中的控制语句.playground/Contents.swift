import UIKit

/** 1、switch语句 */

// switch是一个分支语句，我们在其它很多编程语言中都有见过。不过，Swift中的switch语句
// 可能跟我们之前见到的switch语句有些不太一样，这种不同主要表现在两个方面：
// - 1、在C、C++、Objective-C和Java语句中，switch分支语句只能使用比较离散的整数变量
//     或者常量。但是，在Swift中，switch语句不仅可以使用整数，还可以使用浮点数、字符、
//     字符串和元组等类型，并且它们的值既可以是离散的，也可以是连续的；
// - 2、Swift中的switch语句默认是不穿透的，因此不需要手动添加break语句。相反，如果需要
//     穿透效果，则需要手动添加fallthrough


var grade = 90

switch grade {
case 0..<60:
    print("不及格！")
case 60..<70:
    print("及格")
case 70..<80:
    print("良好")
case 80..<90:
    print("优秀")
default:
    print("非常好")
}


/** 2、guard语句 */

// guard语句的格式如下：

/**
guard 条件表达式 else {
    跳转语句(跳转语句可以是: break、return、continue、throw其中的任何一种)
}
语句组
 
 当条件表达式为true时，跳过else后面花括号中的语句，直接执行后面的语句组；
 当条件表达式为false是，执行else后面花括号中的语句
 */


/** 3、repeat-while语句 */

// Swift中的repeat-while语句就是C和Objective-C语言中的do-while语句
var i = 0
repeat {
    print("i = \(i)")
    i += 1
} while i <= 10


/** 4、区间 */

// 闭区间: 相当于数学意义上的[a, b](a << x << b), eg: 0...10, 表示取从0到10之间所有的值
// 半闭区间: 相当于数学意义上的[a, b)(a << x < b), eg: 0..<10, 表示取从0到10之间所有的的值，但是不包括最后一位数10

// Swift 4.0之后才有的半值区间
// 前半区间: 相当于数学意义上的[0, n](0 << x << m, 其中，n是[0, m]之间的某个整数)
// 后半区间: 相当于数学意义上的[n, m](n << x << m, 其中，n是[0, m]之间的某个整数)

// 关于闭区间和半闭区间很好理解，前半区间和后半区间用代码解释如下():
let array = ["刘备", "诸葛亮", "张飞", "关羽", "赵云", "黄忠", "马超", "姜维", "魏延", "刘禅"]
for (idx, name) in array.enumerated() {
    print("\(name)在数组中的索引为: \(idx)")
}

// 前半区间，从索引为0的元素开始取值，一直取到元素索引为2的位置结束
let x = array[...2]

// 后半区间，从索引为2的元素开始往后面取，一直取到数组最后一位元素结束
let y = array[2...]


/** 5、where语句 */

// where语句主要是用来进行条件过滤的，类似于SQL中的where语句。在Swift中，where语句一般广泛
// 应用于switch和for语句中，也可以用在泛型语句中

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 遍历数组nums中所有的偶数
for num in nums where num % 2 == 0 {
    print("数组nums中的偶数有: \(num)")
}
