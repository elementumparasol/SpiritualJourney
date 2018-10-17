import UIKit


/// 手动创建一棵二叉搜索树(手动确定其根结点)
var exampleTree: BinarySearchTree<Int> = {  // 计算属性
    
    // 创建空的二叉搜索树
    var bst = BinarySearchTree<Int>()
    
    // 往二叉搜索树中添加新的结点
    bst.insert(3)  // 手动确定根结点
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    
    return bst
}()


example(of: "创建一棵BST二叉树") {
    
    // 创建一棵空的BST树
    var bst = BinarySearchTree<Int>()
    
    // 插入新的结点。通过这种方式创建的BST二叉树是
    // 不平衡的，其最终结果跟数组或者链表没有任何区
    // 别，其事件复杂度仍然是O(n)
    for i in 0..<5 {
        bst.insert(i)
    }
    
    // 打印BST树
    print(bst)
}



example(of: "打印二叉搜索树") {
    print(exampleTree)
}
