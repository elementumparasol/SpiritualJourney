/**
 定义链表
 */

import Foundation

public struct LinkedList<T> {
    
    /// 指向头结点的指针，当链表为空时，它的值为nil
    public var head: Node<T>?
    
    /// 指向尾结点的指针，当链表为空时，它的值为nil
    public var tail: Node<T>?
    
    /// 构造方法
    public init() {}
    
    /// 判断链表是否为空
    public var isEmpty: Bool {
        return head == nil
    }
    
    
    // MARK: - 往链表中插入新的结点
    
    /// 在链表的头部添加一个新的结点(头插法)，其时间复杂度为O(1)
    ///
    /// - Parameter value: 新结点的值
    public mutating func push(_ value: T) {
        
        // 实现"写时复制"
        copyNodes()
        
        // 利用值value创建一个新的结点
        // 并且将该结点作为链表的头结点
        head = Node(value: value, next: head)
        
        // 如果尾结点指针为nil
        if tail == nil {
            
            // 让指向尾结点的指针tail指向head
            tail = head
        }
    }
    
    /// 在链表的尾部添加一个新的结点(尾插法)，其时间复杂度为O(1)
    ///
    /// - Parameter value: 新结点的值
    public mutating func append(_ value: T) {
        
        // 实现"写时复制"
        copyNodes()
        
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
    
    /// 根据指定的下标值在链表中寻找与之对应的结点，其时间复杂度为O(i)，其中i表示index的值
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
            
            // 因为当链表不为空，也就是currentNode不等于nil时，
            // 才进入到while循环体中。当出现currentNode的值为
            // nil时，也就是链表中所有的结点都遍历完毕，currentIndex
            // 的值仍然未达到指定的索引值index，那就说明index已
            // 经超出了链表的最大边界，此时给一个提醒
            if currentNode == nil {
                print("下标值越界!链表中最大的索引值不能超过\(currentIndex - 1)")
            }
        }
        
        
        // 如果找到该结点，则将其返回
        return currentNode
    }
    
    /// 在指定的结点后面插入新的结点，其时间复杂度为O(1)
    ///
    /// - Parameters:
    ///   - value: 待插入新结点的值
    ///   - node: 指定的结点，需要在该结点后面插入新的结点
    /// - Returns: 返回新插入的结点
    @discardableResult  // @discardableResult属性用于忽略该方法的返回值(消除编译器警告)
    public mutating func inset(_ value: T, after node: Node<T>) -> Node<T> {
        
        // 实现"写时复制"
        copyNodes()
        
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
    
    
    // MARK: - 从链表中删除指定的结点
    
    /// 从链表头部删除一个结点，并且将该结点的值返回，其时间复杂度为O(1)
    ///
    /// - Returns: 如果链表不为空，则返回该结点的值；如果链表为空，则返回nil
    @discardableResult
    public mutating func pop() -> T? {
        
        // 实现"写时复制"
        copyNodes()
        
        // defer常用于延迟执行一段代码
        // 通常是在函数返回之前执行
        defer {
            
            // 删除头结点，并且原来指向头结点的指针head往后移一个位置
            head = head?.next
            
            // 如果链表为空，则让指向尾结点的指针tail指向nil
            if isEmpty {
                tail = nil
            }
        }
        
        // 返回链表头结点的值
        return head?.value
    }
    
    /// 如果链表不为空，则删除链表中最后一个结点，并且返回该结点的值，其时间复杂度为O(n)
    ///
    /// - Returns: 如果链表不为空，则返回尾结点的值；如果连表为空，则返回nil
    @discardableResult
    public mutating func removeLast() -> T? {
        
        // 实现"写时复制"
        copyNodes()
        
        // 对链表头结点进行校验。如果头结点为nil，
        // 说明链表为空，此时直接返回nil
        guard let head = head else {
            return nil
        }
        
        // 对链表头结点后面的结点进行校验。如果头结点后面的结点
        // 为空，则说明链表中只有一个结点，直接删除该头结点
        guard head.next != nil else {
            return pop()
        }
        
        // pre用来保存尾结点前面的结点，其初始值为头结点
        var pre = head
        
        // current用来保存尾结点，其初始值为头结点
        var current = head
        
        // 使用while循环获取current的下一个结点，并且将该结点
        // 保存到next中。当next(也就是current的next)结点为nil
        // 时，退出while循环。此时pre存储的是链表中倒数第二个结
        // 点，而current中存储的是链表中最后一个结点
        while let next = current.next {
            
            // 将current保存到pre中
            pre = current
            
            // 将next(也就是current的next结点)赋值给current
            current = next
        }
        
        // 删除链表中最后一个结点
        pre.next = nil
        
        // 让指向链表尾结点的指针tail指向pre
        tail = pre
        
        return current.value
    }
    
    /// 如果链表不为空，并且指定结点后面的结点存在，则删除指定结点后面的结点，其时间复杂度为O(1)
    ///
    /// - Parameter node: 链表中的某个结点
    /// - Returns: 如果链表中指定结点后面的结点存在，则删除该结点后面的结点，并且返回被删除结点的值；否则，返回nil
    @discardableResult
    public mutating func remove(after node: Node<T>) -> T? {
        
        // 实现"写时复制"
        copyNodes()
        
        defer {
            
            // 如果指定结点后面的结点刚好是链表的尾结点
            if node.next === tail {
                
                // 则删除node后面的结点，并且让链表中指向链表尾结点
                // 的指针tail重新指向node
                tail = node
            }
            
            // 删除指定结点node后面的结点
            node.next = node.next?.next
        }
        
        // 返回被删除结点的值
        return node.next?.value
    }
    
    /// 实现链表的"写时复制"技术
    private mutating func copyNodes() {
        
        guard !isKnownUniquelyReferenced(&head) else { return }
        
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    
}


// MARK: - CustomStringConvertible
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        
        guard let head = head else {
            return "空链表"
        }
        
        return String(describing: head)
    }
}


// MARK: - Collection
extension LinkedList: Collection {
    
    // 自定义一个Index，以便于对链表中各个结点进行索引
    public struct Index: Comparable {
        
        public var node: Node<T>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            
            switch (lhs.node, rhs.node) {
                
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            
            guard lhs != rhs else { return false }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            
            return nodes.contains { $0 === rhs.node }
        }
        
        
    }
    
    /**
     要遵守Collection协议，必须实现下列4个属性:
     - startIndex
     - endIndex
     - index(afer: )
     - subscript
     */
    
    /// 链表第一个结点的索引
    public var startIndex: Index {
        return Index(node: head)
    }
    
    /// 链表最后一个结点的索引
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    /// 链表中下标为i的结点后面结点的索引
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    /// 链表中某个结点的下标值
    public subscript(position: Index) -> T {
        return position.node!.value
    }
    
    
}
