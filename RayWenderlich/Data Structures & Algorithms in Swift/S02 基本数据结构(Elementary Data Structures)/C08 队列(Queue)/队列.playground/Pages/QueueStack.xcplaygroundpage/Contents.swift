/**
 基于双栈队列的实现
 */

import Foundation

public struct QueueStack<T>: Queue {
    
    // leftStack(当需要出队列时，先翻转rightStack，
    // 然后再将其存储到leftStack中，最后再进行出队列)
    private var leftStack: [T] = []
    
    // rightStack(将入队列的元素存储到rightStack中)
    private var rightStack: [T] = []
    
    // 构造方法
    public init() {}
    
    /// 判断双栈队列是否为空，如果是，则返回true；否则，返回false
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    /// 如果双栈队列不为空，则返回栈顶元素；否则，返回nil
    public var peek: T? {
        
        // 先判断leftStack是否不为空，如果是，那么leftStack中最后一个元素
        // 就是栈顶元素，可直接将其返回；如果leftStack为空，则rightStack中
        // 第一个元素即为栈顶元素，直接将其返回；如果都为空，则返回nil
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    /// 将数据元素压入到双栈队列的顶部
    ///
    /// - Parameter element: 待压入栈顶的元素
    /// - Returns: 如果操作成功，则返回true；否则，返回false
    public mutating func enqueue(_ element: T) -> Bool {
        
        // rightStack是用来存储入栈元素的，所以将新压入的
        // 元素存储到rightStack的末尾(也就是栈顶)
        rightStack.append(element)
        return true
    }
    
    /// 删除栈顶元素，并且将其返回
    ///
    /// - Returns: 如果操作成功，则将其返回；否则，返回false
    public mutating func dequeue() -> T? {
        
        // 判断leftStack是否为空
        if leftStack.isEmpty {
            
            // 如果leftStack为空，则将rightStack整个反转
            // 然后再将其存储到leftStack中
            leftStack = rightStack.reversed()
            
            // 清空rightStack中所有的元素
            rightStack.removeAll()
        }
        
        // 删除leftStack中最后一个元素(其实就是栈顶元素)
        // 然后再将它进行返回
        return leftStack.popLast()
    }
}

// MARK: - CustomStringConvertible
extension QueueStack: CustomStringConvertible {
    
    public var description: String {
        return String(describing: leftStack.reversed() + rightStack)
    }
}



example(of: "双栈队列的演示") {
    
    // 创建队列
    var queue = QueueStack<String>()
    
    // 入队列操作
    queue.enqueue("刘备")
    queue.enqueue("关羽")
    queue.enqueue("张飞")
    
    print(queue)
    
    // 出队列操作
    queue.dequeue()
    
    print(queue)
}
