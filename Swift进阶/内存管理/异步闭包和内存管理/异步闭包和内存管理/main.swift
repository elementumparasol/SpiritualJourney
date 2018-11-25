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
