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
