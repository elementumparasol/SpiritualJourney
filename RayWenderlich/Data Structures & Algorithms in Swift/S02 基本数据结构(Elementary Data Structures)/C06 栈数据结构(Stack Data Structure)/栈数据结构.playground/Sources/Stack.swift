import Foundation

public struct Stack<Element> {
    
    /// 使用数组作为栈的底层存储容器
    private var storage: [Element] = []
    
    /// 构造方法
    public init() {}
    
    /// 将一个已经存在的数组初始化为一个受限制的栈
    ///
    /// - Parameter elements: 一个已经存在的数组
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    /// 将元素压入栈顶，其时间复杂度为O(1)
    ///
    /// - Parameter element: 被压入栈顶的元素
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    /// 当栈不为空时，将元素从栈顶删除并且返回，其时间复杂度为O(1)
    ///
    /// - Returns: 如果栈不为空，则删除栈顶元素，并且将其返回；如果栈为空，则返回nil
    @discardableResult
    public mutating func pop() -> Element? {
        
        // 注意，数组的removeLast()方法和popLast()方法
        // 有很大的区别。前者只是单纯的从数组中删除最后一个
        // 数组元素；而后者不仅从数组中删除最后一个元素，还
        // 将被删除的数组元素进行返回
        return storage.popLast()
    }
    
    /// 返回栈顶元素，其时间复杂度为O(1)
    ///
    /// - Returns: 如果栈不为空，则返回栈顶元素；如果栈为空，则返回nil
    public func peek() -> Element? {
        return storage.last
    }
    
    /// 判断栈是否为空，如果是，则返回true；否则，返回false
    public var isEmpty: Bool {
        return peek() == nil
    }
    
}


// MARK: - CustomStringConvertible
extension Stack: CustomStringConvertible {
    
    public var description: String {
        
        // 栈顶标识线
        let topDivider = "--- 栈顶 ---\n"
        
        // 栈底标识线
        let bottomDivider = "\n--- 栈底 ---"
        
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}


// MARK: - ExpressibleByArrayLiteral
extension Stack: ExpressibleByArrayLiteral {
    
    /// 使用字面量初始化方法创建栈
    ///
    /// - Parameter elements: 可变参数
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
