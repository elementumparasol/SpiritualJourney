import Foundation

/// 指定一个参数，然后对其进行加1，并且将最终结果返回
public func addOne(num: Int) -> Int {
    return num + 1
}


/// 函数的柯里化
///
/// - Parameter adder: 外部参数
/// - Returns: 返回一个闭包类型(Int) -> Int
public func addTo(_ adder: Int) -> (Int) -> Int {
    
    // return { $0 + adder }
    return { num in
        return num + adder
    }
}


public func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    
    // return { $0 > comparer }
    return { num in
        return num > comparer
    }
}
