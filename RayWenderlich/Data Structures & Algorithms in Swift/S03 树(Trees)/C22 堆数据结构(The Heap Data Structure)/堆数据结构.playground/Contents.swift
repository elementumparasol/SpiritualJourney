/**
 堆的实现
 */

import UIKit

/**
 (1)、堆，又称二叉堆(Binary Heap)，堆具有以下两个性质:
 - 结构性，即堆必须是一棵完全二叉树；
 - 堆序型，即根结点通常是最小(大)值结点，也就是说，任意结点的值必须小(大)于它的子结点的值
 
 (2)、注意，这里的堆和内存管理中的堆不是一个概念!我们这里的堆是一种数据组织结构，而
 内存管理中的堆是指代内存池
 
 (3)、堆有两种形式，即大堆(Max Heap)和小堆(Min Heap)。在大堆中，结点的值越大，
 越具有较高的优先级；相对应的，在小堆中，结点的值越小，越具有较高的优先级
 - 在大堆中，父结点的值必须始终大于或者等于其子结点的值，其中根结点拥有最大的值；
 - 在小队中，父结点的值必须始终小于或者等于其子结点的值，其中根结点拥有最小的值。
 */
struct Heap<Element: Equatable> {
    
    /// 数组elements用于存储堆中所有的元素
    var elements: [Element] = []
    
    /// 函数(闭包)参数用于定义堆中的元素如何进行排序
    let sort: (Element, Element) -> Bool
    
    /// 构造方法，用于创建一个堆数据结构
    ///
    /// - Parameter sort: 外界传递进来的函数(闭包)参数，用于确定堆中的元素如何排序
    init(sort: @escaping (Element, Element) -> Bool) {
        self.sort = sort
    }
    
    /// 判断堆是否为空
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    /// 计算堆中元素的个数
    var count: Int {
        return elements.count
    }
    
    /// 取出堆的根结点
    ///
    /// - Returns: 如果堆不为空，则返回根结点；否则，返回nil
    func peek() -> Element? {
        return elements.first
    }
    
    /// 根据当前结点的索引来计算其左子树结点的索引
    ///
    /// - Parameter index: 当前结点的索引
    /// - Returns: 返回当前结点左子树结点的索引
    func leftChildIndex(ofParentAt index: Int) -> Int {
        
        // 当前结点左子树结点的索引值为(2 * i) + 1
        return (2 * index) + 1
    }
    
    /// 根据当前结点的索引来计算其右子树结点的索引
    ///
    /// - Parameter index: 当前结点的所以
    /// - Returns: 返回当前结点右子树结点的索引
    func rightChildIndex(ofParentAt index: Int) -> Int {
        
        // 当前结点右子树结点的索引值为(2 * i) + 2
        return (2 * index) + 2
    }
    
    /// 根据当前结点的索引来计算其父结点的索引
    ///
    /// - Parameter index: 当前结点的索引
    /// - Returns: 返回当前结点父结点的所以
    func parentIndex(ofChildAt index: Int) -> Int {
        
        // 当前结点父结点的索引值为floor((i - 1) / 2)
        return (index - 1) / 2
    }
    
    /// 删除根结点
    ///
    /// - Returns: 如果堆不为空，则返回根结点的值
    mutating func remove() -> Element? {
        
        // 校验堆是否为空，如果是，直接返回nil
        guard !isEmpty else { return nil }
        
        // 交换根结点和最后一个结点的位置
        elements.swapAt(0, -1)  // -1表示最后一个结点，-2表示倒数第二个结点...
        
        defer {
            shiftDown(from: 0)
        }
        
        return elements.removeLast()
    }
    
    /// 交换父结点和子结点的位置
    ///
    /// - Parameter index: 根结点的索引
    mutating func shiftDown(from index: Int) {
        
        // 用于保存父结点的索引
        var parentIndex = index
        
        // 执行交换，直到最终完成并退出
        while true {
            
            // 获取父结点的leftChild结点的索引
            let left = leftChildIndex(ofParentAt: parentIndex)
            
            // 获取父结点的rightChild结点的索引
            let right = rightChildIndex(ofParentAt: parentIndex)
            
            // candidate用于记录与父结点进行交换那个结点的索引
            var candidate = parentIndex
            
            // 如果leftChild结点存在，并且它比父结点拥有更高的优先级
            // 那么就让父结点的leftChild成为进行交换的那个结点
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parentIndex { return }
            
            // 交换父结点和索引candidate所指向的结点
            elements.swapAt(parentIndex, candidate)
            
            parentIndex = candidate
        }
    }
    
    /// 插入一个新的结点到堆中
    ///
    /// - Parameter element: 待插入结点的值
    mutating func insert(_ element: Element) {
        
        // 将新的结点插入到数组elements的末尾
        elements.append(element)
        
        // 执行交换，让堆中的结点重新满足堆的要求
        
    }
    
    /// 交换当前结点和其父结点之间的位置
    ///
    /// - Parameter index: 新插入结点的索引值
    mutating func shiftUp(from index: Int) {
        
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    /// 根据指定的索引删除堆中的结点
    ///
    /// - Parameter index: 需要删除结点在堆中的索引
    /// - Returns: 如果操作成功，则返回该结点的值；否则，返回nil
    mutating func remove(at index: Int) -> Element? {
        
        guard index < elements.count else { return nil }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            
            // 将需要删除的结点和最后一个结点进行交换
            elements.swapAt(index, elements.count - 1)
            
            defer {
                
                // 通过交换，将结点移动到合适的位置
                shiftDown(from: index)
                shiftUp(from: index)
            }
            
            return elements.removeLast()
        }
    }
    
}
