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



example(of: "根据给定的索引在链表中查找与之对应的结点，并且在该结点后面插入新的结点") {
    
    // 创建空的链表
    var list = LinkedList<Int>()
    
    // 采用头插法依次插入新的结点
    list.push(1)
    list.push(3)
    list.push(5)
    
    print("在插入新结点之前，链表list中的元素为: \(list)")
    
    // 查找下标值为1的结点，并且将它的值保存到tmpNode中
    guard let tmpNode = list.node(at: 1) else { return }
    
    // 在tmpNode后面插入新的结点(-1)
    list.inset(-100, after: tmpNode)
    
    print("在插入新结点之后，链表list中的元素为: \(list)")
}



example(of: "如果链表不为空，则删除链表的头结点，并且返回该结点的值") {
    
    // 创建空的链表
    var list = LinkedList<Int>()
    
    // 采用头插法，依次插入新的结点
    list.push(1)
    list.push(3)
    list.push(5)
    
    print("在删除链表头结点之前，链表中的元素为: \(list)")
    
    // 删除链表中的头结点
    let popedNode = list.pop()
    
    print("在删除链表头结点之后，链表中的元素为: \(list)")
    print("被删除的结点值为: " + String(describing: popedNode))
}



example(of: "如果链表不为空，则删除链表中的尾结点，并且返回该结点的值") {
    
    // 创建空的链表
    var list = LinkedList<Int>()
    
    // 采用头插法，依次添加新的结点
    list.push(1)
    list.push(3)
    list.push(5)
    
    print("在删除链表尾结点之前，链表中的元素依次为: \(list)")
    
    // 删除链表中的尾结点
    let removedNode = list.removeLast()
    
    print("在删除链表尾结点之后，链表中的元素依次为: \(list)")
    print("被删除结点的值为: " + String(describing: removedNode))
}



example(of: "如果链表不为空，删除指定结点后面的某个结点") {
    
    // 创建空的结点
    var list = LinkedList<Int>()
    
    // 采用头插法，依次插入新的结点
    list.push(2)
    list.push(4)
    list.push(6)
    list.push(8)
    list.push(10)
    
    print("在删除指定结点后面的结点之前，链表中的元素依次为: \(list)")
    
    // 获取链表中下标值为2的结点
    guard let node = list.node(at: 2) else { return }
    
    // 删除链表中node(下标值为2的结点)后面的结点(也就是下标值为3的结点)
    let removedValue = list.remove(after: node)
    
    print("在删除指定结点后面的结点之后，链表中的元素依次为: \(list)")
    print("被删除结点的值为:" + String(describing: removedValue))
}



example(of: "遵守Collection协议之后") {
    
    // 创建空的链表
    var list = LinkedList<Int>()
    
    // 采用尾插法，依次插入新的结点
    for i in 0..<10 {
        list.append(i)
    }
    
    // 打印链表list
    print(list)
    print("链表第一个结点: \(list[list.startIndex])")
    print("链表中前3个结点的值所组成的数组为: \(Array(list.prefix(3)))")
    print("链表中后3个结点的值所组成的数组为: \(Array(list.suffix(3)))")
    print("链表中所有结点值的和为: \(list.reduce(0, +))")
}



example(of: "数组的\"写时复制\"") {
    
    // 创建数组
    let array1 = [1, 2]
    var array2 = array1
    
    // 在往array2中添加新的元素之前
    // array1和array2引用的是同一段内存
    print("array1: \(array1)")
    print("array2: \(array2)")
    
    print("\n--- 往array2中添加新的数组元素: 3 ---\n")
    array2.append(3)
    
    // 在往array2中添加新的元素之后
    // array2会拷贝array1，然后再将
    // 新的数据元素添加到自己的内存中
    print("array1: \(array1)")
    print("array2: \(array2)")
}
