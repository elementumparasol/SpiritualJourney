/**
 平衡二叉树(又称AVL树)结点的实现
 */

import Foundation

public class AVLNode<Element> {
    
    /// 平衡二叉树结点的值
    public var value: Element
    
    /// 平衡二叉树的左子树
    public var leftChild: AVLNode?
    
    /// 平衡二叉树的右子树
    public var rightChild: AVLNode?
    
    /// 平衡二叉树的高度
    public var height = 0
    
    /// 计算该结点左子树的高度
    public var leftHeight: Int {
        
        // 计算该结点的左子树高度；如果该结点
        // 的左子树为空，则计该结点的高度为-1
        return leftChild?.height ?? -1
    }
    
    /// 计算该结点右子树的高度
    public var rightHeight: Int {
        
        // 计算该结点的右子树高度；如果该结点
        // 的右子树为空，则计该结点的高度为-1
        return rightChild?.height ?? -1
    }
    
    /// 平衡二叉树的平衡因子
    public var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    /// 构造方法
    ///
    /// - Parameter value: 结点的值
    public init(value: Element) {
        
        // 初始化属性value
        self.value = value
    }
}

// MARK: - CustomStringConvertible
extension AVLNode: CustomStringConvertible {
    
    // 自定义二叉树的输出样式
    public var description: String {
        return diagram(for: self)
    }
    
    // 输出二叉树的输出样式图
    private func diagram(for node: AVLNode?,
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

// MARK: - 二叉树的遍历算法
extension AVLNode {
    
    /// 先序遍历二叉树
    ///
    /// - Parameter visit: 函数(或者说闭包)参数，用来访问二叉树的结点
    public func traversePreOrder(visit: (Element) -> Void) {
        
        // 访问根结点
        visit(value)
        
        // 递归遍历根结点的左子树
        leftChild?.traversePreOrder(visit: visit)
        
        // 递归遍历根结点的右子树
        rightChild?.traversePreOrder(visit: visit)
    }
    
    /// 中序遍历二叉树
    ///
    /// - Parameter visit: 函数(或者说闭包)参数，用来访问二叉树的结点
    public func traverseInOrder(visit: (Element) -> Void) {
        
        // 递归遍历根结点的左子树
        leftChild?.traverseInOrder(visit: visit)
        
        // 访问根结点
        visit(value)
        
        // 递归遍历根结点的右子树
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// 后序遍历二叉树
    ///
    /// - Parameter visit: 函数(或者说闭包)参数，用来访问二叉树的结点
    public func traversePostOrder(visit: (Element) -> Void) {
        
        // 递归遍历根结点的左子树
        leftChild?.traversePostOrder(visit: visit)
        
        // 递归遍历根结点的右子树
        rightChild?.traversePostOrder(visit: visit)
        
        // 访问根结点
        visit(value)
    }
}
