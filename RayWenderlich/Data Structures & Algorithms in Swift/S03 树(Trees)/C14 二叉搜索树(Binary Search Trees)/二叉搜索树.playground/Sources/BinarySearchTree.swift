/**
 二叉搜索树的实现
 */

import Foundation

/**
 BST最重要的两个规则:
 - 左子项的值必须小于它父结点的值；
 - 右子项的值必须大于或者等于它父结点的值。
 */
class BinarySearchTree<Element: Comparable> {
    
    /// 二叉搜索树的根结点。关键字private(set)表示在外部只读，而在内部可写
    public private(set) var root: BinaryNode<Element>?
    
    /// 构造方法
    public init() {}
}

// MARK: - CustomStringConvertible
extension BinarySearchTree: CustomStringConvertible {
    
    // 自定义二叉搜索树的样式
    public var description: String {
        
        // 对二叉搜索树的根结点进行校验
        guard let root = root else { return "空的二叉搜索树" }
        return String(describing: root)
    }
}
