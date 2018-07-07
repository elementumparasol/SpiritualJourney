import UIKit

/** 1、用throwing函数传递错误 */

// 为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个
// 标有throws关键字的函数被称作throwing函数。如果这个函数指明了返回值类型，throws关键词需
// 要写在箭头（->）的前面:
// func canThrowErrors() throws -> String
// func cannotThrowErrors() -> String
// 一个 throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
// 下面的例子中，VendingMachine类有一个vend(itemNamed:) 方法，如果请求的物品不存在、缺货
// 或者投入金额小于物品价格，该方法就会抛出一个相应的 VendingMachineError

enum VendingMachineError: Error {
    case invalidSelection                    //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                          //缺货
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

