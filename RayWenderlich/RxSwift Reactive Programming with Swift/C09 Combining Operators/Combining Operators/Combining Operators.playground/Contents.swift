import UIKit
import RxSwift

example(of: "startWith") {
    
    let disposeBag = DisposeBag()
    
    // 创建一个整数类型的可观察序列
    let numbers = Observable.of(2, 3, 4)
    
    // 创建一个以整数1作为开头的序列，然后
    // 在此基础上继续使用原有的可观察序列
    // 注意，它的返回值还是源序列，只不过序列前面有指定值
    let observable = numbers.startWith(1)
    observable.subscribe(onNext: { value in
        print(value)
    }).disposed(by: disposeBag)
}


example(of: "Observable.concat") {
    
    let disposeBag = DisposeBag()
    
    // 创建两个序列
    let first = Observable.of(1, 2, 3)
    let second = Observable.of(4, 5, 6)
    
    // 将两个序列进行合并
    let observable = Observable.concat([second, first])
    
    observable.subscribe(onNext: { value in
        print(value)
    }).disposed(by: disposeBag)
}


example(of: "concat") {
    
    let disposeBag = DisposeBag()
    
    let shu = Observable.of("刘备", "关羽", "张飞", "诸葛亮")
    let wu = Observable.of("孙权", "周瑜", "鲁肃")
    let consortium = shu.concat(wu)
    
    consortium.subscribe(onNext: { value in
        print(value)
    }).disposed(by: disposeBag)
}


example(of: "concatMap") {
    
    let sequence = [
        "shu": Observable.of("刘备", "关羽", "张飞"),
        "wu": Observable.of("孙权", "周瑜", "鲁肃")
    ]
    
    let observable = Observable.of("wu", "shu")
        .concatMap({ kingdom in
            
            // 通过键取出字典中的Observable
            sequence[kingdom] ?? .empty()
        })
    
    _ = observable.subscribe(onNext: { value in
        print(value)
    })
}


example(of: "merge") {
    
    // 创建两个subject
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    // 创建一个源Observable
    let source = Observable.of(left.asObserver(),
                               right.asObserver())
    
    // 以上面那两个subject为基础，创建一个
    // 合并的Observable，并且订阅它
    let observable = source.merge()
    let disposable = observable.subscribe(onNext: { value in
        print(value)
    })
    
    // 数组
    var leftValues = ["刘备", "关羽", "张飞"]
    var rightValues = ["孙权", "周瑜", "鲁肃"]
    
    // 当数组leftValues或者rightValues
    // 不为空时，循环使用这两个数组里面的值
    repeat {
        if arc4random_uniform(2) == 0 {
            if !leftValues.isEmpty {
                left.onNext("Left: " + leftValues.removeFirst())
            }
        } else if !rightValues.isEmpty {
            right.onNext("Right: " + rightValues.removeFirst())
        }
    } while !leftValues.isEmpty || !rightValues.isEmpty
    
    disposable.dispose()
}


example(of: "combineLatest") {
    
    // 创建两个subject作为内部序列
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    // 创建一个新的Observable实例，并且该序列是以上面
    // 这两个subject为基础合并而来的
    let observable = Observable.combineLatest(left, right, resultSelector: { lastLeft, lastRight in
        "\(lastLeft) \(lastRight)"
    })
    
    // 订阅上面那个新创建的Observable实例
    let disposable = observable.subscribe(onNext: { value in
        print("输出结果: \(value)")
    })
    
    // left和right分别发出不同的事件元素
    print("> Sending a value to Left")
    left.onNext("Hello,")
    
    print("> Sending a value to Right")
    right.onNext("world")
    
    print("> Sending a value to Right")
    right.onNext("RxSwift")
    
    print("> Sending a value to Left")
    left.onNext("Have a good day,")
    
    disposable.dispose()
}


example(of: "Zip") {
    
    enum Weather {
        case cloudy
        case sunny
    }
    
    let disposeBag = DisposeBag()
    
    let left: Observable<Weather> = Observable.of(.sunny, .cloudy, .cloudy, .sunny)
    let right = Observable.of("Shanghai", "Nanjing", "Hangzhou", "Xiamen", "Wuhan")
    
    let observable = Observable.zip(left, right, resultSelector: { (weather, city) -> String in
        return "It's \(weather) in \(city)"
    })
    
    observable.subscribe(onNext: { value in
        print(value)
    }).disposed(by: disposeBag)
}


example(of: "withLatestFrom") {
    
    // 分别创建两个subject，用于模拟按钮点击和textField输入
    let button = PublishSubject<Void>()
    let textField = PublishSubject<String>()
    
    // 忽略button发出的值，取而代之的是，发
    // 出从textField中接收到的最新值(将textField的数据作为参数)
    let observable = button.withLatestFrom(textField)
    
    _ = observable.subscribe(onNext: { value in
        print(value)
    })
    
    // 模拟textField的连续输入，这是通过两
    // 次连续按下button完成的
    textField.onNext("Par")
    textField.onNext("Pari")
    textField.onNext("Paris")
    button.onNext(())  // 触发接收textField最新的值
    button.onNext(())
}


example(of: "sample") {
    
    let button = PublishSubject<Void>()
    let textField = PublishSubject<String>()
    
    // 将触发器button当做参数
    let observable = textField.sample(button)
    
    _ = observable.subscribe(onNext: { value in
        print(value)
    })
    
    textField.onNext("Par")
    textField.onNext("Pari")
    textField.onNext("Paris")
    button.onNext(())  // 触发接收textField最新的值
    button.onNext(())
}


example(of: "amb") {
    
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    // 创建一个Observable实例，通过amb(_ : )
    // 来决定接收left还是right所发出的事件。通常
    // 情况下，谁先做出反应就接收谁所发出的事件
    let observable = left.amb(right)
    let disposable = observable.subscribe(onNext: { value in
        print(value)
    })
    
    // 让两个序列都发送数据(也就是事件)
    right.onNext("Beijing")  // right最先发出事件
    left.onNext("Shanghai")
    right.onNext("Nanjing")
    left.onNext("Hangzhou")
    left.onNext("Xiamen")
    right.onNext("Wuhan")
    
    disposable.dispose()
}


example(of: "switchLatest") {
    
    // 创建三个subject
    let one = PublishSubject<String>()
    let two = PublishSubject<String>()
    let three = PublishSubject<String>()
    
    // 创建一个事件源subject
    let source = PublishSubject<Observable<String>>()
    
    // 使用switchLatest()运算符创建一个observable并打印它的输出
    let observable = source.switchLatest()
    let disposable = observable.subscribe(onNext: { value in
        print(value)
    })
    
    // 使用Observable提供事件源，并且使用元素值提供Observable
    source.onNext(one)
    one.onNext("Some text from sequence one")  // 输出
    two.onNext("Some text from sequence two")
    
    source.onNext(two)
    two.onNext("More text from sequence two")  // 输出
    one.onNext("and also from sequence one")
    
    source.onNext(three)
    two.onNext("Why don't you see me?")
    one.onNext("I'm alone, help me")
    three.onNext("Hey it's three. I win.")  // 输出
    
    source.onNext(one)
    one.onNext("Nope. It's me, one!")  // 输出
    
    disposable.dispose()
}
