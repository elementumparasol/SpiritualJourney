import UIKit

example(of: "创建一棵平衡二叉树") {
    
    var tree = AVLTree<Int>()
    
    for i in 0..<15 {
        tree.insert(i)
    }
    
    print(tree)
}
