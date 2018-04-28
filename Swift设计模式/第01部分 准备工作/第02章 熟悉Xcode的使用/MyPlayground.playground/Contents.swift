//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var counter = 0
var secondCounter = 0

// 因为从Swift 3开始，已经不支持C语言风格的for循环了
// 所以，我们要习惯这种带边界的for循环写法
for i in 0..<10 {
    counter += i
    print("Counter: \(counter)")
    
    for j in 1...10 {
        secondCounter += j
        print("secondCounter: \(secondCounter)")
    }
}


let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
textField.text = "Hello, Swift!"
textField.borderStyle = UITextBorderStyle.bezel
