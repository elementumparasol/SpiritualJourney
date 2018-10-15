import UIKit


/// 创建二叉树
var tree: BinaryNode<String> = {
    
    let volkswagen = BinaryNode(value: "大众")
    
    let porsche = BinaryNode(value: "保时捷")
    let macan = BinaryNode(value: "Macan")
    let cayenne = BinaryNode(value: "卡宴")
    let audi = BinaryNode(value: "奥迪")
    let r8 = BinaryNode(value: "奥迪R8")
    
    volkswagen.leftChild = porsche
    porsche.leftChild = macan
    porsche.rightChild = cayenne
    volkswagen.rightChild = audi
    audi.leftChild = r8
    
    return volkswagen
}()



example(of: "打印二叉树示意图") {
    print(tree)
}



example(of: "中序遍历一棵二叉树") {
    
    tree.traverseInOrder(visit: { print($0)} )
}



example(of: "先序遍历一棵二叉树") {
    
    tree.traversePreOrder(visit: { print($0) })
}



example(of: "后序遍历一棵二叉树") {
    
    tree.traversePostOrder(visit: { print($0) })
}
