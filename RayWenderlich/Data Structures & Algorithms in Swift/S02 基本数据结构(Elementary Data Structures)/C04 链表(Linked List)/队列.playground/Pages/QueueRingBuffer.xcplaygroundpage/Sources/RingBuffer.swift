/**
 RingBuffer是实现
 */

import Foundation

public struct RingBuffer<T> {
    
    // RingBuffer的存储容器
    private var array: [T?]
    
    // 用于追踪RingBuffer的首部元素
    private var readIndex = 0
    
    // 用于追踪RingBuffer中可以存储元素的单位
    private var writeIndex = 0
    
    
    /// 构造方法
    ///
    /// - Parameter count: 指定RingBuffer存储容量的大小
    public init(count: Int) {
        array = Array<T?>(repeating: nil, count: count)
    }
    
    /// 如果RingBuffer不为空，则返回首部元素；否则，返回nil
    public var first: T? {
        return array[readIndex]
    }
    
    /// 往RingBuffer中添加新的元素
    ///
    /// - Parameter element: 待添加的新元素
    /// - Returns: 如果操作成功，则返回true；否则，返回false
    public mutating func write(_ element: T) -> Bool {
        
        // 判断RingBuffer的存储空间是否未满
        if !isFull {
            
            // 如果存储空间未满，则将新的元素element存储到RingBuffer的尾部
            array[writeIndex % array.count] = element
            
            // writeIndex的值加1
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    /// 读取RingBuffer中的元素
    ///
    /// - Returns: 如果操作成功，则返回该元素的值；否则，返回nil
    public mutating func read() -> T? {
        
        // 判断RingBuffer的存储空间是否未空
        if !isEmpty {
            
            // 读取RingBuffer中的元素
            let element = array[readIndex % array.count]
            
            // readIndex的值加1
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    /// 返回RingBuffer中剩余未读取的元素
    private var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    /// 判断RingBuffer是否为空，如果是，则返回true；否则，返回false
    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    /// 返回RingBuffer中剩余的存储空间
    private var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    /// 判断RingBuffer是否已满，如果是，则返回true；否则，返回false
    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }
}
