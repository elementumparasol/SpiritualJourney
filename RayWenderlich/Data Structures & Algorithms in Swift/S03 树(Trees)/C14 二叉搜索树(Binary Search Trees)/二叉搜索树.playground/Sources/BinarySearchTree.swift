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

// MARK: - 二叉搜索树的一些基本操作
extension BinarySearchTree {
    
    /// 插入一个新的结点
    ///
    /// - Parameter value: 待插入新结点的值
    public mutating func insert(_ value: Element) {
        
        // 创建二叉搜索树的根结点(或者子树的根结点)
        root = insert(from: root, value: value)
    }
    
    /// 在二叉搜索树中插入新的结点
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
    
    /// 在二叉搜索树中删除指定的结点
    ///
    /// - Parameter value: 待删除结点的值
    public mutating func remove(_ value: Element) {
        
        // 递归二叉搜索树，删除指定的结点
        root = remove(node: root, value: value)
    }
    
    /// 删除二叉搜索树中的结点
    ///
    /// - Parameters:
    ///   - node: 二叉搜索树中的结点
    ///   - value: 指定要删除的值
    /// - Returns: 如果操作成功，则返回删除的结点；否则，返回nil
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        
        // 对二叉搜索树中的结点进行校验，如果为空，则返回nil
        guard let node = node else { return nil }
        
        // 如果指定的value值刚好等于二叉搜索树中结点node的值
        if value == node.value {
            
            /** 1、如果待删除的结点正好是叶子结点 */
            
            // 如果二叉搜索树的结点node是叶子结点(没有左、右子树)
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            /** 2、如果待删除的结点只有一个子树(左子树或者右子树) */
            
            // 如果二叉搜索树的结点node没有左子树(只有右子树)
            if node.leftChild == nil {
                
                // 返回结点node的右子树
                return node.rightChild
            }
            
            // 如果二叉搜索树的结点node没有右子树(只有左子树)
            if node.rightChild == nil {
                
                // 返回结点的左子树
                return node.rightChild
            }
            
            /** 3、如果待删除的结点既有左子树，又有右子树 */
            
            // 如果二叉搜索树的结点node既有左子树，又有右子树
            // 那么就找到该结点右子树中最小结点的值，并将其保存起来
            node.value = node.rightChild!.min.value
            
            // 删除结点node的右子树中最小的结点，然后用这个最小的结点替换node的右子结点
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            
            // 如果指定的value值小于二叉搜索树中结点node的值，那么递归进入node的左子树
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            
            // 如果指定的value值大于或者等于二叉搜索树中结点node的值，那么递归进入node的右子树
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
    
    /// 检索二叉搜索树中是否包含指定的结点，其时间复杂度为O(logn)
    ///
    /// - Parameter value: 待搜索结点的值
    /// - Returns: 如果二叉搜索树中包含指定结点的值，则返回true；否则，返回false
    public func contains(_ value: Element) -> Bool {
        
        // current用来保存当前开始搜索的结点(其默认值为root根结点)
        var current = root
        
        // 当current的值不等于nil时，检查node的值
        while let node = current {  // 当node的值不为nil时，进入循环体
            
            // 如果node的值刚好是要查找结点的值，搜索结束，返回true
            if node.value == value {
                return true
            }
            
            // 如果待搜索结点的值小于node的值
            if value < node.value {
                
                // 开始搜索current的左子项
                current = node.leftChild
            } else {
                
                // 开始搜索current的右子项
                current = node.rightChild
            }
        }
        
        return false
    }
    
    /// 检索二叉搜索树中是否包含指定的结点，其时间复杂度为O(n)
    ///
    /// - Parameter value: 待搜索结点的值
    /// - Returns: 如果二叉搜索树中包含指定结点的值，则返回true；否则，返回false
    public func contains1(_ value: Element) -> Bool {
        
        // 校验二叉搜索树是否为空，如果是，则返回false；否则，继续
        guard let root = root else { return false }
        
        // 记录返回结果
        var found = false
        
        // 中序遍历二叉搜索树中所有的结点
        root.traverseInOrder(visit: {  // 主要是中序遍历耗费了比较多的时间
            
            // 如果找到了指定的值，将found赋值为true
            if $0 == value {
                found = true
            }
        })
        
        // 返回最终的结果
        return found
    }
    
}

// MARK: - 扩展BinaryNode
private extension BinaryNode {
    
    /// 求二叉搜索树中最小的结点
    var min: BinaryNode {
        
        // 递归查找左子树中的最小结点，然后将其返回
        return leftChild?.min ?? self
    }
}
