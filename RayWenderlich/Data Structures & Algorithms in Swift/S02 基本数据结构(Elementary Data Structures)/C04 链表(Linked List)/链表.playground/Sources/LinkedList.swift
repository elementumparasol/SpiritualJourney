/**
 定义链表
 */

import Foundation

public struct LinkedList<T> {
    
    /// 指向头结点的指针，当链表为空时，它的值为nil
    public var head: Node<T>?
    
    /// 指向尾结点的指针，当链表为空时，它的值为nil
    public var tail: Node<T>?
    
    /// 构造函数
    public init() {}
    
    /// 判断链表是否为空
    public var isEmpty: Bool {
        return head == nil
    }
    
    
    // MARK: - 链表的一些基本操作
    
    /// 在链表的头部添加一个新的结点(头插法)
    ///
    /// - Parameter value: 新结点的值
    public mutating func push(_ value: T) {
        
        // 利用值value创建一个新的结点
        // 并且将该结点作为链表的头结点
        head = Node(value: value, next: head)
        
        // 如果尾结点指针为nil
        if tail == nil {
            
            // 让指向尾结点的指针tail指向head
            tail = head
        }
    }
    
    /// 在链表的尾部添加一个新的结点(尾插法)
    ///
    /// - Parameter value: 新结点的值
    public mutating func append(_ value: T) {
        
        // 校验链表是否为空
        guard !isEmpty else {
            
            // 如果链表为空，则采用头插法将新
            // 结点插入到链表中作为第一个结点
            push(value)
            return
        }
        
        // 如果链表不为空，则将新结点作为尾结点
        // 指针tail的下一个结点
        tail!.next = Node(value: value)
        
        // 让尾结点指针tail重新指向新的尾结点
        tail = tail!.next
        
        // tail!.next = nil
    }
    
    
    
}


extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        
        guard let head = head else {
            return "空链表"
        }
        
        return String(describing: head)
    }
}
