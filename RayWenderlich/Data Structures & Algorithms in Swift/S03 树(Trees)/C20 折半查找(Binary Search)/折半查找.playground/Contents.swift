import UIKit

example(of: "折半查找示例") {
    
    // 按照升序进行排列的数组
    let array = [1, 3, 5, 6, 8, 10, 11, 13, 15]
    
    // 使用数组的方法查值为11的元素
    let search11 = array.index(of: 11)
    
    // 使用折半查找在数组中查找值为11的元素
    let binarySearch11 = array.binarySearch(for: 11)
    
    print("index(of: ): \(String(describing: search11))")
    print("binarySearch(for: ): \(String(describing: binarySearch11))")
}
