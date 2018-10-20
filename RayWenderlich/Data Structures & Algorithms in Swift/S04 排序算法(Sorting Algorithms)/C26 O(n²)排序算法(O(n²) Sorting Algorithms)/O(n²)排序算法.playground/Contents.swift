import UIKit

example(of: "冒泡儿排序") {
    
    var array = [9, 4, 10, 3]
    print("数组的原始顺序为: \(array)")
    
    bubbleSort(&array)
    print("对数组进行排序之后的顺序为: \(array)")
}



example(of: "选择排序") {
    
    var array = [9, 4, 10, 3]
    print("数组的原始顺序为: \(array)")
    
    selectionSort(&array)
    print("经过选择排序之后，数组的顺序为: \(array)")
}



example(of: "插入排序") {
    
    var array = [9, 4, 10, 3]
    print("元组的原始顺序为: \(array)")
    
    insertionSort(&array)
    print("经过插入排序之后，数组的顺序为: \(array)")
}
