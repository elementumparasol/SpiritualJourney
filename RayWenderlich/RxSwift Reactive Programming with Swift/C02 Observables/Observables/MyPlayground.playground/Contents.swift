import UIKit
import RxSwift

example(of: "just") {
    
    // 创建整型常量
    let one = 1
    let two = 2
    
    // 调用just方法，传入一个整型参数one来创建一个
    // Int类型的Observable序列。just方法用来创建
    // 一个只包含单个元素的可观察序列。并且，just是
    // Observable里面的一个类型方法
    let observable: Observable<Int> = Observable<Int>.just(one)
    print("observable: \(observable)")
    
    // 在使用just方法创建可观察序列的时候，传入一个数组参数
    // 最终返回的结果也是一个数组类型
    let observableArray = Observable.just([one, two])
    print(observableArray)
}


example(of: "of") {
    
    // 创建整型常量
    let one = 1
    let two = 2
    let three = 3
    
    // 调用of方法创建一个可观察序列
    let observable = Observable.of(one, two, three)
    print(observable)
    
    // 注意，与just方法在创建可观察序列的时候只能传入一个参数
    // 所不同，of方法的参数是可变的。也就是说，在利用of方法创
    // 建可变参数的时候，可以一次传入多个参数。另外，虽然在创建
    // 可观察序列的时候传入的是多个参数，但是最终返回的结果仍然
    // 是单个可观察序列，并不是可观察序列数组。如果你希望通过of
    // 方法来创建可观察序列数组，那么在传入参数时应该传入数组
    let observableArray = Observable.of([one, two])
    print(observableArray)
}


example(of: "from") {
    
    let one = 1
    let two = 2
    let three = 3
    
    // from方法的参数类型是一个数组，但是它返回的结果却是单个元素
    // 也就是说，在通过from方法创建可观察序列时，需要传入一个数组
    // 参数，但是最终创建的可观察序列并不是数组类型
    let observable = Observable.from([one, two, three])
    print(observable)
}
