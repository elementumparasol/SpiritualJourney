/**
 Trie树结点的实现
 */

import Foundation

public class TrieNode<Key: Hashable> {
    
    /// key用于保存结点的数据。它之所以为可选类型
    /// 主要是因为Tie树的根结点没有key(不保存数据)
    public var key: Key?
    
    /// Trie树结点拥有一个指向其父结点的弱引用
    /// 该弱引用用于简化后续的删除操作
    public weak var parent: TrieNode?
    
    /// 在二叉搜索树中，结点通常会拥有一个左子树和一个
    /// 右子树。但是在Trie树中，一个结点通常会拥有多个
    /// 结点。我们用一个children字典来处理他们
    public var children: [Key: TrieNode] = [:]
    
    /// isTerminating用于表示集合终止的结束符
    public var isTerminating = false
    
    /// 构造方法，用于创建Trie树的结点
    ///
    /// - Parameters:
    ///   - key: 用于保存结点的数据
    ///   - parent: 指向其父结点的引用
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
