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
