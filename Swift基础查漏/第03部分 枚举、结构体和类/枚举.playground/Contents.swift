import UIKit

// 我们可能在其他编程语言中使用过枚举，但是，Swift的枚举一定会颠覆你
// 之前形成的观念。Swift语言中的枚举非常的强大，它具有面向对象的特性


/** 1、基本枚举 */

enum TextAlignment {
    case left
    case right
    case center
}

var alignment: TextAlignment = TextAlignment.left
alignment = .center  // 修改
