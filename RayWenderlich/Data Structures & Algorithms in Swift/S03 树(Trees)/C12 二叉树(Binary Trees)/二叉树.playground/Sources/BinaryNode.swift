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
