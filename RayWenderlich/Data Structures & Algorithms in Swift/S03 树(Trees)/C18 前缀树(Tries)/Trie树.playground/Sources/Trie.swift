/**
 Trie树的实现
 */

import Foundation

// 泛型CollectionType遵守Collection协议，除此之外，
// CollectionType中所有的元素又必须遵守Hashable协议
// 之所以如此定义，主要是因为我们将使用集合中的元素作为
// TrieNode中子项字典的键
public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    
    /// 类型别名
    public typealias Node = TrieNode<CollectionType.Element>
    
    // 根结点
    private let root = Node(key: nil, parent: nil)
    
    /// 构造方法，用于创建Trie树的结点
    public init() {}
    
    public func insert(_ collection: CollectionType) {
        
        // current用于追踪遍历的进度，默认是从根结点开始
        var current = root
        
        // 遍历集合collection中所有的元素
        for element in collection {
            
            // 检查元素element是否存在于Trie树的结点current
            // 的children中。如果不存在，我们就创建一个新的结点
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            
            // 将新创建的结点存储到current中
            current = current.children[element]!
        }
        
        // 遍历结束之后，此时current应该指向集合
        // 的结束结点，我们将其标记为终止结点
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        guard current.isTerminating else {
            return
        }
        current.isTerminating = false
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }
    
    
    
    
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        
        var results: [CollectionType] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
        }
        
        return results
    }
}
