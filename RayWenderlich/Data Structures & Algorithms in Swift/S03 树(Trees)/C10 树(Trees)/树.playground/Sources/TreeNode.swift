/**
 树的结点的实现
 */

import Foundation

public class TreeNode<T> {
    
    /// 用于保存当前结点的值
    public var value: T
    
    /// 用于保存当前结点的子结点
    public var children: [TreeNode] = []
    
    /// 构造方法
    public init(_ value: T) {
        self.value = value
    }
    
    /// 添加新的子结点
    ///
    /// - Parameter child: 待添加的子结点
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

// MARK: - 树的遍历
extension TreeNode {
    
    /// 深度优先遍历
    ///
    /// - Parameter visit: 函数(或者说闭包)参数，用来遍历整个树的结点
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        
        visit(self)
        children.forEach {
            
            // 递归下一个结点
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    /// 按层序遍历
    ///
    /// - Parameter visit: 函数(或者闭包)参数，用来遍历整个树的结点
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

// MARK: - Equatable
extension TreeNode where T: Equatable {
    
    /// 搜索树中的某个结点
    ///
    /// - Parameter value: 待搜索结点的值
    /// - Returns: 如果搜索成功，则返回该结点的值；否则，返回nil
    public func search(_ value: T) -> TreeNode? {
        
        // 用于保存搜索结果
        var result: TreeNode?
        
        // 按照层次，对树进行遍历
        forEachLevelOrder(visit: { node in
            
            // 比对搜索结果
            if node.value == value {
                
                // 如果搜索成功，则将结果保存到result中
                result = node
            }
        })
        
        // 返回搜索结果
        return result
    }
    
}
