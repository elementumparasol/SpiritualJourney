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
