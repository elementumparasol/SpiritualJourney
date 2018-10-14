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
