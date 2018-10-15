/**
 二叉树结点的实现
 */

import Foundation

public class BinaryNode<Element> {
    
    /// 二叉树结点的值
    public var value: Element
    
    /// 二叉树的左子树
    public var leftChild: BinaryNode?
    
    /// 二叉树的右子树
    public var rightChild: BinaryNode?
    
    /// 构造方法
    public init(value: Element) {
        self.value = value
    }
}

// MARK: - CustomStringConvertible
extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        
        return diagram(for: self)
    }
    
    /// 自定义输出格式
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }

    
}

// MARK: - 二叉树的遍历
extension BinaryNode {
    
    /// 中序遍历二叉树
    ///
    /// - Parameter visit: 函数(或者闭包)参数，用于访问二叉树的结点
    public func traverseInOrder(visit: (Element) -> Void) {
        
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// 先序遍历二叉树
    ///
    /// - Parameter visit: 函数(或者闭包)参数，用于访问二叉树的结点
    public func traversePreOrder(visit: (Element) -> Void) {
        
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    /// 后序遍历二叉树
    ///
    /// - Parameter visit: 函数(或者闭包)参数，用于访问二叉树的结点
    public func traversePostOrder(visit: (Element) -> Void) {
        
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
