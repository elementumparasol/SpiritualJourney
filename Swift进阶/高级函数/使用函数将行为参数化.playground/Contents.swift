//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/**
 * Swift函数库中一些常用的函数
 *  map 和 ĪatMap — 如何对元素进⾏变换
 *  filter — 元素是否应该被包含在结果中
 *  reduce — 如何将元素合并到⼀个总和的值中
 *  sequence — 序列中下⼀个元素应该是什么？
 *  forEach — 对于⼀个元素，应该执⾏怎样的操作
 *  sort，lexicographicCompare 和 partition — 两个元素应该以怎样的顺序进⾏排列
 *  index，first 和 contains — 元素是否符合某个条件
 *  min 和 max — 两个元素中的最⼩/最⼤值是哪个
 *  elementsEqual 和 starts — 两个元素是否相等
 *  split — 这个元素是否是⼀个分割符
 *  preix - 当判断为真的时候，将元素滤出到结果中。⼀旦不为真，就将剩余的抛弃
 *  drop - 当判断为真的时候，丢弃元素。⼀旦不为真，返回将其余的元素。和 preĩx(while:) 类似，不过返回相反的集合。
 */

let names = ["James", "Paul", "Jimmy"]
var lastNameEndingInL: String?
for name in names.reversed() where name.hasSuffix("l") {
    
    // 找到一字母l结尾的名字之后进行赋值，并且结束查找
    lastNameEndingInL = name
    break
}
lastNameEndingInL


extension Sequence {
    
    func last(where predicate: (Element) -> Bool) -> Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}

let match = names.last{$0.hasSuffix("l")}
match
