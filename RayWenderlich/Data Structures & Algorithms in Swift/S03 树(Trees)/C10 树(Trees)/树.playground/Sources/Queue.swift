/**
 双栈队列的实现
 */

import Foundation

public struct Queue<T> {
    
    // 队列的左栈，主要是用来出队列操作
    private var leftStack: [T] = []
    
    // 队列的右栈，主要是用来入队列操作
    private var rightStack: [T] = []
    
    /// 构造方法
    public init() {}
    
    /// 判断队列是否为空，如果是，则返回true；否则，返回false
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    /// 如果队列不为空，则返回队首元素的值；否则，返回nil
    public var peek: T? {
        
        // 由于leftStack是专门用来出队列操作的，所以，首先判断leftStack是否
        // 不为空，如果是，直接返回leftStack的最后一个元素(也就是栈顶元素)；如
        // 过leftStack为空，则返回rightStack的第一个元素(也就是rightStack
        // 的栈顶元素)；如果leftStack和rightStack都为空，则直接返回nil
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    /// 在队列的队尾进行入队列操作
    ///
    /// - Parameter element: 待入队列的元素
    /// - Returns: 如果操作成功，则返回true；否则，返回false
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        
        // 将数据元素压入到rightStack的栈顶(也就是队列的队尾)
        rightStack.append(element)
        return true
    }
    
    /// 在队列的队首执行出队列操作
    ///
    /// - Returns: 如果操作成功，则返回队首元素的值；否则，返回nil
    public mutating func dequeue() -> T? {
        
        // 因为在队列中，leftStack是负责出队列操作的
        // 因此，先判断leftStack是否为空
        if leftStack.isEmpty {
            
            // 如果leftStack为空，则先将rightStack中的
            // 元素进行反转，然后再将其存储到leftStack中
            leftStack = rightStack.reversed()
            
            // 将rightStack中的元素存储到leftStack中以后，
            // rightStack中的元素就没用了，直接清除就可以
            rightStack.removeAll()
        }
        
        // 因为队列的底层是用栈实现的，而rightStack在反转之后
        // 元素属于栈顶的first元素到了leftStack中就变成了last
        // 元素；原来rightStack中的last元素到了leftStack中
        // 之后就变成了first元素。这种操作不仅符合栈先入后出的特性
        // 也满足队列先入先出的特性。因为在出队列时，调用栈的popLast()
        return leftStack.popLast()
    }
    
}
