//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、filter函数的基本使用 */

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let result = nums.filter{ $0 % 2 == 0 }  // { num in num % 2 == 0 } 这里的num使用前面的$0取代了
result



/** 2、map函数和filter函数的结合使用 */

let mixedResult = (1..<10).map { $0 * $0 }.filter { $0 % 2 == 0 }
mixedResult
