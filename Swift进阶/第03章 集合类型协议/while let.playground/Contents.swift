import UIKit

var str = "Hello, playground"

// while let 语句和 if let ⾮常相似，它代表⼀个当条件返回 nil 时终⽌的循环
while let line = readLine() {
    print(line)
}


while let line = readLine(), !line.isEmpty {
    print(line)
}


let array = [1, 2, 3, 4, 5]
var iterator = array.makeIterator()

// func print(_ items: Any..., separator: String = default, terminator: String = default)
while let i = iterator.next() {
    print(i, terminator: "")
}


for i in 0..<10 where i % 2 == 0 {
    print(i, separator: " ")
}


var myIterator = (0..<10).makeIterator()
while let i = myIterator.next() {
    if i % 2 == 0 {
        print("i = \(i)")
    }
}
