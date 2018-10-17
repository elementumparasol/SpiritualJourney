/**
 二叉搜索树的实现
 */

import Foundation

/**
 BST最重要的两个规则:
 - 左子项的值必须小于它父结点的值；
 - 右子项的值必须大于或者等于它父结点的值。
 */
public struct BinarySearchTree<Element: Comparable> {
    
    /// 二叉搜索树的根结点。关键字private(set)表示在外部只读，而在内部可写
    public private(set) var root: BinaryNode<Element>?
    
    /// 构造方法
    public init() {}
}

// MARK: - CustomStringConvertible
extension BinarySearchTree: CustomStringConvertible {
    
    // 自定义二叉搜索树的输出样式
    public var description: String {
        
        // 对二叉搜索树的根结点进行校验
        guard let root = root else { return "空的二叉搜索树" }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    
    /// 插入一个新的结点
    ///
    /// - Parameter value: 待插入新结点的值
    public mutating func insert(_ value: Element) {
        
        // 创建二叉搜索树的根结点(或者子树的根结点)
        root = insert(from: root, value: value)
    }
    
    /// 插入新的结点
    ///
    /// - Parameters:
    ///   - node: 当前结点
    ///   - value: 待插入结点的值
    /// - Returns: 返回新的结点(也就是刚插入的结点)
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        
        // 对当前结点node进行校验
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        // 如果value的值小于当前结点node的值
        if value < node.value {
            
            // 将新的结点插入到当前结点node的左子项
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            
            // 将新的结点插入到当前结点node的右子项
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
}
