/**
 双链表结点的实现
 */

import Foundation

public class Node<T> {
    
    /// 结点的数据域，用来保存当前结点的值
    public var value: T
    
    /// 结点的后继指针，用来保存当前结点的后继
    /// 如果当前结点没有后继，则为nil
    public var next: Node<T>?
    
    /// 结点的前驱指针，用来保存当前结点的前驱
    /// 如果当前结点没有前驱，则为nil
    public var previous: Node<T>?
    
    /// 构造方法
    public init(value: T) {
        self.value = value
    }
}

// MARK: - CustomStringConvertible
extension Node: CustomStringConvertible {
    
    public var description: String {
        return String(describing: value)
    }
}
