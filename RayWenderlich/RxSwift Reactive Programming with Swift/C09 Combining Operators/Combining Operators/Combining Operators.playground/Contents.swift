import UIKit
import RxSwift

example(of: "startWith") {
    
    // 创建一个整数类型的可观察序列
    let numbers = Observable.of(2, 3, 4)
    
    // 创建一个以整数1作为开头的序列，然后
    // 在此基础上继续使用原有的可观察序列
    // 注意，它的返回值还是源序列，只不过序列前面有指定值
    let observable = numbers.startWith(1)
    observable.subscribe(onNext: { value in
        print(value)
    })
}


example(of: "Observable.concat") {
    
    let first = Observable.of(1, 2, 3)
    let second = Observable.of(4, 5, 6)
    
    let observable = Observable.concat([first, second])
    
    observable.subscribe(onNext: { value in
        print(value)
    })
}


example(of: "concat") {
    
    let shu = Observable.of("刘备", "关羽", "张飞", "诸葛亮")
    let wu = Observable.of("孙权", "周瑜", "鲁肃")
    let consortium = shu.concat(wu)
    
    consortium.subscribe(onNext: { value in
        print(value)
    })
    
}


example(of: "concatMap") {
    
    let sequence = [
        "shu": Observable.of("刘备", "关羽", "张飞"),
        "wu": Observable.of("孙权", "周瑜", "鲁肃")
    ]
    
    let observable = Observable.of("shu", "wu")
        .concatMap({ kingdom in
            sequence[kingdom] ?? .empty()
        })
    
    _ = observable.subscribe(onNext: { value in
        print(value)
    })
}
