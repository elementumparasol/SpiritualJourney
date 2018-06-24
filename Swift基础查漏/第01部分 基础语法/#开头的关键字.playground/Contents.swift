import UIKit

var str = "Hello, playground"

func myLogFunction(_ message: String) {
    print("FUNCTION: \(#function), COLUMN: \(#column), FILE: \(#file), LINE: \(#line), \(message)")
}

// 函数调用
myLogFunction("my own log function.")
