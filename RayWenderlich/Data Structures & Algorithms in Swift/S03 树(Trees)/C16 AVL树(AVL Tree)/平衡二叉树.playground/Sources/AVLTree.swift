/**
 平衡二叉树(AVL树)的实现
 */

import Foundation

/**
 平衡二叉树，又称AVL树，它具有以下特性:
 - 它的左子树和右子树也都是平衡二叉树，且左子树和右子
   树的深度只差的绝对值不超过1；
 - 若将平衡二叉树上结点的平衡因子(Balance Factor)
   定义为该结点的左子树的深度减去它右子树的深度，那么
   平衡二叉树上所有结点的平衡因子取值只能是-1、0和1；
 - 只要二叉树上有一个结点的平衡因子的绝对值大于1，那么
   该二叉树就是不平衡的。
 */
public struct AVLTree<Element: Comparable> {
    
    /// 平衡二叉树的根结点
    public private(set) var root: AVLNode<Element>?
    
    /// 构造方法
    public init() {}
}

// MARK: - CustomStringConvertible
extension AVLTree: CustomStringConvertible {
    
    // 自定义AVLTree的输出样式
    public var description: String {
        guard let root = root else { return "空的平衡二叉树" }
        return String(describing: root)
    }
}

// MARK: - 平衡二叉树的旋转操作
extension AVLTree {
    
    /// 往左旋转二叉树，让整个二叉树重新达到平衡
    ///
    /// - Parameter node: 二叉树原来的根结点
    /// - Returns: 返回旋转之后二叉树新的根结点
    private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        // 获取当前结点node的右子树，并且将其保存到pivot中
        // 稍后我们会议pivot作为中心进行旋转
        let pivot = node.rightChild!
        
        // 获取pivot的右子树，然后将其作为旋转之后pivot的右子树
        node.rightChild = pivot.leftChild
        
        // 将原始结点node作为旋转之后pivot的左子树
        pivot.leftChild = node
        
        // 旋转之后结点node和pivot的高度都发生了变化，需要进行更新
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        return pivot
    }
    
    /// 往右旋转二叉树，让整个二叉树重新达到平衡
    ///
    /// - Parameter node: 二叉树原来的根结点
    /// - Returns: 返回旋转之后二叉树新的根结点
    private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        return pivot
    }
    
    
    private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        guard let rightChild = node.rightChild else { return node }
        
        node.rightChild = rightRotate(rightChild)
        
        return leftRotate(node)
    }
    
    private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        guard let leftChild = node.leftChild else { return node }
        
        node.leftChild = leftRotate(leftChild)
        
        return rightRotate(node)
    }
    
    private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        switch node.balanceFactor {
        case 2:
            if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotate(node)
            }
        case -2:
            if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotate(node)
            }
        default:
            return node
        }
    }
}

// MARK: - 检查平衡二叉树中是否包含指定的元素
extension AVLTree {
    
    public func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

// MARK: - 计算平衡二叉树中结点的最小值
private extension AVLNode {
    
    var min: AVLNode {
        return leftChild?.min ?? self
    }
}

// MARK: - 平衡二叉树中的插入和删除操作
extension AVLTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {
        
        guard let node = node else {
            return AVLNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        
        return balancedNode
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
}
