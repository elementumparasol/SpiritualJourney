import Foundation

public protocol Queue {
    
    // 关联协议的类型。注意，在协议中使用associatedtype时，仅仅
    // 是告诉编译器，协议中使用了某种类型，但是并未具体指明是设么类
    // 型。这个有点类似于泛型中的占位符
    associatedtype Element
    
    /// 在队列的尾部插入一个元素，如果操作成功，则返回true；否则，返回false
    mutating func enqueue(_ element: Element) -> Bool
    
    /// 如果队列不为空，则删除队首元素并且将其返回；如果队列为空，则直接返回nil
    mutating func dequeue() -> Element?
    
    /// 判断队列是否为空，如果是，则返回true；否则，返回false
    var isEmpty: Bool { get }
    
    /// 如果队列不为空，则返回队首元素；否则，直接返回nil
    var peek: Element? { get }
}
