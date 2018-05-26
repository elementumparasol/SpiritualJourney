//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let result = nums.filter{ $0 % 2 == 0 }  // { num in num % 2 == 0 } 这里的num使用前面的$0取代了
result
