import UIKit

example(of: "栈的基本操作演示") {
    
    let stack = Stack()
    
    stack.isEmpty
    
    stack.push(element: 1)
    stack.push(element: 2)
    
    stack.isEmpty
    
    print(stack.peek!)
    
    print(stack.pop()!)
}
