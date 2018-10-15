import UIKit

/// 创建一棵树
///
/// - Returns: 返回已创建的树
func makeBeverageTree() -> TreeNode<String> {
    
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    
    let tea = TreeNode("Tea")
    let coffee = TreeNode("Coffee")
    let chocolate = TreeNode("Cocoa")
    
    let blackTea = TreeNode("Black")
    let greenTea = TreeNode("Green")
    let chaiTea = TreeNode("Chai")
    
    let soda = TreeNode("Soda")
    let milk = TreeNode("Milk")
    
    let gingerAle = TreeNode("Ginger ale")
    let bitterLemon = TreeNode("Bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}



example(of: "深度优先遍历") {
    
    // 创建树
    let tree = makeBeverageTree()
    
    // 遍历树
    tree.forEachDepthFirst(visit: { print($0.value) })
}



example(of: "按层序遍历") {
    
    let tree = makeBeverageTree()
    tree.forEachLevelOrder(visit: { print($0.value) })
}



example(of: "在树中搜索指定的结果，如果搜索成功，则将其返回") {
    
    let tree = makeBeverageTree()
    
    if let searchResult1 = tree.search("Ginger ale") {
        print("查找结果: \(searchResult1.value)")
    } else {
        print("没有找到指定的结点")
    }
    
    if let searchResult2 = tree.search("WKD Blue") {
        print("查找结果: \(searchResult2.value)")
    } else {
        print("没有找到指定的结点")
    }
}
