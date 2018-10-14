/**
 基于RingBuffer实现的队列
 */

import Foundation

public struct QueueRingBuffer<T>: Queue {
    
    // QueueRingBuffer的存储器
    private var ringBuffer: RingBuffer<T>
    
    /// 构造函数
    public init(cout: Int) {
        ringBuffer = RingBuffer<T>(count: cout)
    }
    
    /// 判断QueueRingBuffer是否为空，如果是，则返回true；否则，返回false
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    /// 返回QueueRingBuffer的第一个元素；如果为空，则返回nil
    public var peek: T? {
        return ringBuffer.first
    }
    
    /// 将数据元素插入到QueueRingBuffer中
    ///
    /// - Parameter element: 待插入的数据元素
    /// - Returns: 如果操作成功，则返回true；否则，返回false
    public mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    /// 将数据元素从QueueRingBuffer中删除
    ///
    /// - Returns: 如果操作成功，则返回被删除元素的值；否则，返回nil
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : ringBuffer.read()
    }
}

// MARK: - CustomStringConvertible
extension QueueRingBuffer: CustomStringConvertible {
    
    public var description: String {
        return String(describing: ringBuffer)
    }
}




example(of: "QueueRingBuffer的演示实例") {
    
    // 创建空的queue
    var queue = QueueRingBuffer<String>(cout: 10)
    
    // 入队列操作
    queue.enqueue("刘备")
    queue.enqueue("关羽")
    queue.enqueue("张飞")
    
    print(queue)
    
    // 出队列操作
    queue.dequeue()
    
    print(queue)
}
