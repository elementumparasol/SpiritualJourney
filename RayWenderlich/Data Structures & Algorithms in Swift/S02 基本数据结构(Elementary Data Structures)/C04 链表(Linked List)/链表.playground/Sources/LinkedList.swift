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
    
    /// 根据指定的下标值在链表中寻找与之对应的结点
    ///
    /// - Parameter index: 指定的下标值
    /// - Returns: 如果找到该下标值所对应的结点，则将该结点返回；否则，返回nil
    public func node(at index: Int) -> Node<T>? {
        
        // currentNode用来保存查找结果，其默认值为头结点
        var currentNode = head
        
        // currentIndex作为计数器，其默认值为头结点所对应的下标值
        var currentIndex = 0
        
        // 当链表不为空，并且计数器currentIndex没有越界时，遍历链表
        // 如果列表为空，或者计数器currentIndex越界，则返回值为nil
        while currentNode != nil && currentIndex < index {
            
            // 将下一个结点保存到currentNode中
            currentNode = currentNode!.next
            
            // 计数器currentIndex加一
            currentIndex += 1
        }
        
        // 如果找到该结点，则将其返回
        return currentNode
    }
    
    /// 在指定的结点后面插入新的结点
    ///
    /// - Parameters:
    ///   - value: 待插入新结点的值
    ///   - node: 指定的结点，需要在该结点后面插入新的结点
    /// - Returns: 返回新插入的结点
    @discardableResult
    public mutating func inset(_ value: T, after node: Node<T>) -> Node<T> {
        
        // 校验指定的结点node是否为尾结点
        guard tail !== node else {
            
            // 如果node是尾结点，则采用尾插法，直接将新结点插入到链表的尾部
            append(value)
            return tail!
        }
        
        // 根据value的值创建新的结点，并且让新结点的next指向指定结点的下一个结点
        // 最后，再将新结点插入到指定结点的后面
        node.next = Node(value: value, next: node.next)
        
        // 返回新插入的结点
        return node.next!
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
