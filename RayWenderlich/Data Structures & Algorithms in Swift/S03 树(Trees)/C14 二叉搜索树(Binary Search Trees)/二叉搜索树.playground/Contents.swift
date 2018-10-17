import UIKit

example(of: "创建一棵BST二叉树") {
    
    // 创建一棵空的BST树
    var bst = BinarySearchTree<Int>()
    
    // 插入新的结点
    for i in 0..<5 {
        bst.insert(i)
    }
    
    // 打印BST树
    print(bst)
}
