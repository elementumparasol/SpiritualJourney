import UIKit

example(of: "输出链表的结点") {
    
    // 创建结点
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    // 将node2设置成node1的下一结点
    node1.next = node2
    node2.next = node3
    
    // 打印node1
    print(node1)
}



example(of: "采用头插法，在链表头部插入新的结点") {
    
    // 创建一个空的链表
    var list = LinkedList<Int>()
    
    // 采用头插法，依次插入新的结点
    list.push(1)
    list.push(3)
    list.push(5)
    
    // 打印链表list
    print(list)
}



example(of: "采用尾插法，在链表的尾部插入新的结点") {
    
    // 创建一个空的链表
    var list = LinkedList<Int>()
    
    // 采用尾插法，依次插入新的结点
    list.append(1)
    list.append(3)
    list.append(5)
    
    // 打印链表list
    print(list)
}
