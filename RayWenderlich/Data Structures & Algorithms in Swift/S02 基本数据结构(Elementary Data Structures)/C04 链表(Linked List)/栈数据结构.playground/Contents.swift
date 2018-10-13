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
}
