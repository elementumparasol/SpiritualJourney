import Foundation

/**
 * 栈是一种受限制的线性存储结构，它只能在栈顶
 * 进行操作。先入栈的后出，后入栈的先出
 */
public class Stack {
    
    /// 底层存储容器
    public var stack: [Any]
    
    /// 判断栈是否为空
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    /// 返回栈顶元素；如果栈为空，则返回nil
    public var peek: Any? {
        return stack.last
    }
    
    /// 构造方法
    public init() {
        stack = [Any]()
    }
    
    /// 入栈操作
    public func push(element: Any) {
        stack.append(element)
    }
    
    /// 出栈操作
    public func pop() -> Any? {
        
        // 如果栈不为空，则删除数组stack最后
        // 一个元素，并且将其返回；否则，返回nil
        if !isEmpty {
            return stack.removeLast()
        } else {
            return nil
        }
    }
    
}
