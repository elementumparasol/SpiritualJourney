import UIKit

/** 空合运算符(Nil Coalescing Operator) */
// 空合运算符(a ?? b)将对可选类型a进行空判断，如果a包含一个值就进行解封，否则
// 就返回一个默认值b。表达式a必须是Optional类型。默认值b的类型必须要和a 储值的类型保持一致。

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

// 如果userDefinedColorName有值，那么colorNameToUse的值就是userDefinedColorName的值
// 如果userDefinedColorName没有值，那么colorNameToUse的值就是defaultColorName的值
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"
