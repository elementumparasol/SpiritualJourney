import Foundation

// 定义链表的结点

public class Node<T> {
    
    /// 结点的数据域
    public var value: T
    
    /// 指向下一个结点的指针域，有可能为空
    public var next: Node?
    
    /// 创建一个结点，并且对结点的属性进行初始化
    ///
    /// - Parameters:
    ///   - value: 数据域
    ///   - next: 指向下一个结点(尾结点没有下一个结点)
    public init(value: T, next: Node? = nil) {
        
        // 初始化结点的指针域和数据域
        self.value = value
        self.next = next
    }
}


// MARK: - CustomStringConvertible
extension Node: CustomStringConvertible {
    
    /// 自定义输出参数
    public var description: String {
        
        // 对next的值进行校验
        guard let next = next else {
            return "\(value)"
        }
        
        // init(describing:) 用给定的值创建一个字符串
        // (Creates a string representing the given value)
        return "\(value) -> " + String(describing: next) + " "
    }
}
