import UIKit

example(of: "冒泡儿排序") {
    
    var array = [9, 4, 10, 3]
    print("数组的原始顺序为: \(array)")
    
    bubbleSort(&array)
    print("对数组进行排序之后的顺序为: \(array)")
}

