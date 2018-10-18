/**
 堆的实现
 */

import UIKit

/**
 (1)、堆，又称二叉堆(Binary Heap)，堆具有以下两个性质:
 - 结构性，即堆必须是一棵完全二叉树；
 - 堆序型，即根结点通常是最小值结点，也就是说，任意结点的值必须小于它的子结点的值
 
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
    
    
}
