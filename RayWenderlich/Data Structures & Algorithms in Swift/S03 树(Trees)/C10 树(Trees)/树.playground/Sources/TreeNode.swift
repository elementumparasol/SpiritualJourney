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
    
    /// 深度优先搜索
    ///
    /// - Parameter visit: 函数(或者说闭包)参数，用来遍历整个树的结点
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        
        visit(self)
        children.forEach {
            
            // 递归下一个结点
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        
        visit(self)
        
        
    }
}
