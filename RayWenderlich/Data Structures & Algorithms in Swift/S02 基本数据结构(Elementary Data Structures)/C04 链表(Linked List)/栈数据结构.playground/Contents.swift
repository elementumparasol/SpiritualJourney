import UIKit

example(of: "栈的使用") {
    
    // 创建一个栈
    var stack = Stack<Int>()
    
    // 将下列元素依次压入栈顶
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    // 删除栈顶元素
    guard let popedElement = stack.pop() else { return }
    
    print("被删除的栈顶元素为: \(popedElement)")
    print(stack)
    print(stack.isEmpty)
}



example(of: "将一个已经存在的数组初始化为一个栈") {
    
    // 数组
    let array = ["张飞", "刘备", "关羽"]
    
    // 将数组array初始化为一个栈
    var stack = Stack(array)
    
    print(stack)
    
    // 入栈和出栈
    stack.pop()
    stack.push("诸葛亮")
    print()
    print(stack)
}



example(of: "使用字面量初始化方法来创建一个栈") {
    
    // 使用字面量语法创建一个浮点数类型的栈
    var stack: Stack = [1.414, 1.732, 2]
    stack.push(2.236)
    print(stack)
}
