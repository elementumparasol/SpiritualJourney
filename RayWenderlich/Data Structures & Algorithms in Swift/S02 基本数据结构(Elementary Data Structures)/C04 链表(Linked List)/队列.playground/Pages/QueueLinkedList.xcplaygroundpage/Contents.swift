/**
 基于链表实现的队列
 */

import Foundation

public class QueueLinkedList<T>: Queue {
    
    // 使用双链表作为队列的存储容器
    private var list = DoublyLinkedList<T>()
    
    /// 构造方法
    public init() {}
    
    /// 在双链表队列的尾部插入新的元素，其时间复杂度为O(1)
    ///
    /// - Parameter element: 待插入到双链表队列中的元素
    /// - Returns: 如果操作成功，则返回true；否则，返回false
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    /// 删除双链表队列队首元素，并且返回该元素的值，其时间复杂度为O(1)
    ///
    /// - Returns: 如果双链表队列不为空，则删除队首元素，并且返回它的值；否则，返回nil
    public func dequeue() -> T? {
        
        // 对双链表队列进行校验(判断双链表队列是否不为空，其首元素是否存在)
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        
        // 将双链表的队首元素从链表中删除，并且将其进行返回
        return list.remove(element)
    }
    
    /// 如果双链表队列不为空，则返回队首元素的值；否则，返回nil
    public var peek: T? {
        return list.first?.value
    }
    
    /// 如果双链表队列为空，则返回true；否则，返回false
    public var isEmpty: Bool {
        return list.isEmpty
    }
}
