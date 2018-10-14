/**
 双链表的实现
 */

import Foundation

public class DoublyLinkedList<T> {
    
    // 指向双链表头结点的指针
    private var head: Node<T>?
    
    // 指向双链表尾结点的指针
    private var tail: Node<T>?
    
    /// 构造方法
    public init() { }
    
    /// 判断双链表是否为空，如果是，则返回true；否则，返回false
    public var isEmpty: Bool {
        return head == nil
    }
    
    /// 如果双链表不为空，则返回它的头结点；否则，返回nil
    public var first: Node<T>? {
        return head
    }
    
    /// 往双链表的尾部添加新的结点
    ///
    /// - Parameter value: 新添加结点的值
    public func append(_ value: T) {
        
        // 根据指定的value创建新的结点
        let newNode = Node(value: value)
        
        // 对双链表的尾结点进行校验
        guard let tailNode = tail else {
            
            // 如果双链表的尾结点为空，则表示整个链表为空
            // 那么新添加的结点就是双链表现在唯一的结点。
            // 让指向双链表头部结点和尾部结点的指针head和
            // tail分别指向新添加的结点
            head = newNode
            tail = newNode
            return
        }
        
        // 让新添加结点的前驱指针指向链表中原来的尾结点
        newNode.previous = tailNode
        
        // 双链表中原来尾结点的后继指针指向新添加的结点
        tailNode.next = newNode
        
        // 让指向双链表尾部结点的指针tail指向新的尾部结点
        tail = newNode
    }
    
    /// 删除双链表中指定的结点，并且将该结点的值进行返回
    ///
    /// - Parameter node: 双链表中待删除的结点
    /// - Returns: 待删除结点的值
    public func remove(_ node: Node<T>) -> T {
        
        // 待删除结点的前驱结点
        let prev = node.previous
        
        // 待删除结点的后继结点
        let next = node.next
        
        // 删除当前结点node，并且对其进行校验
        if let prev = prev {
            
            // 如果待删除结点的前驱结点pre存在，那么结点
            // pre的后继结点变为待删除结点node的后继结点
            prev.next = next
        } else {
            
            // 如果待删除结点node的前驱不存在，则说明当前
            // 结点node就是双链表的头结点。所以，删除当前
            // 结点node之后，双链表新的头结点就变为当前结
            // 点node的后继结点
            head = next
        }
        
        // 修改待删除结点node的后继结点next的前驱结点
        next?.previous = prev
        
        // 对待删除结点node的后继结点进行校验
        if next == nil {
            
            // 如果待删除结点刚好为双链表的尾结点，也就是说
            // 当前待删除结点node的后继为nil，那么删除当前
            // 结点node之后，则双链表新的尾结点是待删除结点
            // node的前驱结点，所以指向双链表尾结点的指针tail
            // 需要往前移动一个位置
            tail = prev
        }
        
        // node被删除，清空它的前驱指针
        node.previous = nil
        
        // node被删除，清空它的后继指针
        node.next = nil
        
        // 将被删除结点的值返回
        return node.value
    }
}

// MARK: - CustomStringConvertible
extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }
        return string + "队尾"
    }
}

/// 创建双链表的迭代器，以便快速访问链表中的元素
public class LinkedListIterator<T>: IteratorProtocol {
    
    private var current: Node<T>?
    
    init(node: Node<T>?) {
        current = node
    }
    
    public func next() -> Node<T>? {
        defer { current = current?.next }
        return current
    }
}

// MARK: - Sequence
extension DoublyLinkedList: Sequence {
    
    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(node: head)
    }
}
