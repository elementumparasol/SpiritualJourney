/**
 基于数组实现的队列
 */

import Foundation

public struct QueueArray<T>: Queue {
    
    /// 使用数组作为队列的存储容器
    private var array: [T] = []
    
    /// 构造方法
    public init() {}
    
    /// 判断队列是否为空
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    /// 如果队列不为空，则返回队首元素；否则，返回nil
    public var peek: T? {
        return array.first
    }
    
    /// 在队列尾部插入一个元素，其时间复杂度为O(1)
    ///
    /// - Parameter element: 待插入的元素
    /// - Returns: 如果操作成功，则返回true；否则，返回false
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    /// 删除队首元素并将其返回，其时间复杂度为O(n)
    ///
    /// - Returns: 如果队列不为空，则删除队首元素，并将其返回；否则，返回nil
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()  // 后面的元素会往前移动
    }
}
