import UIKit

// Any可以用来表示任何类型，包括值类型和引用类型。而AnyObject只能用来表示引用类型

var any = [Any]()
any.append("anything")  // String
any.append(2)  // Int
any.append(3.14)  // Double
any.append(("james", 23))  // 元组
any.append(UIView())  // 引用类型
for item in any {
    print("\(item)")
}


var anyObject = [AnyObject]()
anyObject.append(UIView())  // 引用类型
// anyObject.append(3.14) 添加非引用了性就会出错  
