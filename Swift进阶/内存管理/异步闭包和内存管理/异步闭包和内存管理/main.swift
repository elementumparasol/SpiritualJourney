//
//  main.swift
//  异步闭包和内存管理
//
//  Created by Enrica on 2018/11/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

// MARK: - 类的循环引用

example(of: "Weak Reference") {
    
    class Tutorial {
        let title: String
        
        // 一个Tutorial实例并不总是会拥有一个
        // Editor实例，所以我们这里使用弱引用
        weak var editor: Editor?
        
        init(title: String) {
            self.title = title
        }
        
        // Swift在自动调用析构器deinitializer之前，
        // 会从内存中释放对象，并且设置其引用计数器为0
        deinit {
            print("Goodbye Tutorial \(title)!")
        }
    }
    
    class Editor {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Editor \(name)!")
        }
    }
    
    // 我们使用一个do语句，将Tutorial和Editor实例
    // 放在它里面，一旦代码执行完毕，它们就会被释放
    do {
        let tutorial = Tutorial(title: "Memory management")
        let editor = Editor(name: "Ray")
        tutorial.editor = editor
        editor.tutorials.append(tutorial)
    }
}


example(of: "Unowned Reference") {
    
    class Tutorial {
        let title: String
        
        // Tutorial一定是有作者的，因此不能将其声明为
        // 弱引用，可以将其声明为无主引用
        unowned let author: Author
        weak var editor: Editor?
        
        init(title: String, author: Author) {
            self.title = title
            self.author = author
        }
        
        deinit {
            print("Goodbye Tutorial \(title)!")
        }
    }
    
    class Editor {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Editor \(name)!")
        }
    }
    
    class Author {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodby Author \(name)!")
        }
    }
    
    do {
        let editor = Editor(name: "Ray")
        let author = Author(name: "Cosmin")
        let tutorial = Tutorial(title: "Memory management",
                                author: author)
        author.tutorials.append(tutorial)
        tutorial.editor = editor
        editor.tutorials.append(tutorial)
    }
}


// MARK: - 闭包的循环引用

example(of: "Capture lists") {
    
    var counter = 0
    
    // 注意，此时闭包有一个指向变量counter的引用
    var f = { print("counter = \(counter)") }
    
    // 更新变量counter的值为1
    counter = 1
    f()  // 打印 counter = 1
    
    // 总结：此时闭包f()之所以会打印变量counter更新以后的值
    // 主要是因为，闭包有一个指向变量counter的引用
    
    
    /**
     * 使用捕获列表，创建新的变量c
     */
    counter = 0
    
    // 在闭包中添加一个捕获列表[c = counter]
    f = { [c = counter] in
        print("c = \(c)")
    }
    counter = 1
    f()  // 打印 c = 0
    
    
    /**
     * 在多数情况下，我们不用去创建一个类似于上面那样的
     * 新的变量c，只需要使用简写的捕获列表[counter]即
     * 可。其中，捕获列表中的变量counter是一个局部变量
     * 它用来表示原始的变量counter。在这种情况下，闭包
     * f()依旧打印0值，主要是因为捕获的变量counter只是
     * 原始变量的副本
     */
    counter = 0
    f = { [counter] in
        print("counter = \(counter)")
    }
    counter = 1
    f()  // 打印 counter = 0
}


example(of: "Unowned self") {
    
    class Tutorial {
        let title: String
        unowned let author: Author
        weak var editor: Editor?
        
        init(title: String, author: Author) {
            self.title = title
            self.author = author
        }
        
        deinit {
            print("Goodbye Tutorial \(title)!")
        }
        
        // 在这个闭包中，我们使用self.author.name捕获了
        // Tutorial实例对象。也就是说，我们在Tutorial实
        // 例对象和闭包之间创建了一个循环引用，因此Tutorial
        // 的deinit方法不会被调用
        lazy var createDescription: () -> String = {
            
            return "\(self.title) by \(self.author.name)"
        }
    }
    
    class Editor {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Editor \(name)!")
        }
    }
    
    class Author {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Author \(name)!")
        }
    }
    
    do {
        let author = Author(name: "Cosmin")
        let tutorial = Tutorial(title: "Memory management", author: author)
        
        // 在这里调用了createDescription()方法
        print(tutorial.createDescription())
        
        let editor = Editor(name: "Ray")
        author.tutorials.append(tutorial)
        tutorial.editor = editor
        editor.tutorials.append(tutorial)
    }
}


// MARK: - 逃逸闭包

example(of: "GCD") {
    
    func log(message: String) {
        let thread = Thread.current.isMainThread ? "Main" : "Background"
        print("\(thread) thread: \(message)")
    }
    
    func addNumbers(upTo range: Int) -> Int {
        log(message: "Adding numbers...")
        return (1...range).reduce(0, +)
    }
    
    // 创建一个串行队列
    let queue = DispatchQueue(label: "queue")
    
    
    /// 调度函数execute在后台闭包中执行，然后再将结果传递给主队列上的闭包
    ///
    /// - Parameters:
    ///   - backgroundWork: 在后台执行的闭包，无参数，有返回值
    ///   - mainWork: 在主队列中执行的闭包，有一个参数，无返回值
    func execute<Result>(backgroundWork: @escaping () -> Result, mainWork: @escaping (Result) -> ()) {
        
        // 异步执行串行队列
        queue.async {
            print("当前线程1为: \(Thread.current)")
            // 在之前定义的串行队列上异步执行backgroundWork闭包，
            // 然后将其返回值存储起来
            let result = backgroundWork()
            
            // 回到主线程执行
            DispatchQueue.main.async {
                print("当前线程2为: \(Thread.current)")
                // 在主队列上异步执行mainWork，然后再将
                // backgroundWork的结果作为参数传递给它
                mainWork(result)
            }
        }
    }
    
    // 调用函数execute(backgroundWork: mainWork: )
    execute(backgroundWork: { addNumbers(upTo: 100) }, mainWork: { log(message: "The sum is \($0)") })
}


