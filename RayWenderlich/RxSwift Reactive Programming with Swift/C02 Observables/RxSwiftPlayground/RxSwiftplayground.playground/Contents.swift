import RxSwift

/// 创建Observable实例
example(of: "just, of, from") {
    
    // 创建整数实例
    let one = 1
    let two = 2
    let three = 3
    
    // 使用参数one，然后调用just方法创
    // 建一个Int类型的Observable序列
    // 除了传入单个参数以外，just方法也可以
    // 传入一个数组参数
    let observable: Observable<Int> = Observable<Int>.just(one)
    
    // 传入多个参数，调用of方法创建一个新的Observable实例
    // 注意，observable2在这里并不是数组。如果要创建一个
    // Observable数组实例，最好是传入一个数组参数
    let observable2 = Observable.of(one, two, three)
    
    // 传入一个数组参数，然后调用of方法创建一个Observable数组实例
    let observable3 = Observable.of([one, two, three])
    
    // from方法使用一个数组作为参数
    let observable4 = Observable.from([one, two, three])
}



/// 订阅Observable
example(of: "Subscribe") {
    
    let one = 1
    let two = 2
    let three = 3
    
    let observable = Observable.of(one, two, three)
    
    // 监听observable。我们在这里传入了一个闭包
    // 作为subscribe()方法的参数。又因为只有一个
    // 闭包参数(也就是闭包是最后一个参数)，所以，我
    // 们其实也可以将其写成尾随闭包的形式
    observable.subscribe({event in
        
        if let element = event.element {
            print(element)
        }
    })
    
    observable.subscribe(onNext: { (element) in
        print(element)
    })
    
}



/// 监听empty.
/// empty Observable的作用主要是: 当你需要返回一个立即
/// 终止(completed)，或者零值观察者时，就需要使用这个
example(of: "empty") {
    
    // 因为我们要创建一个空的Observable实例，因此它无法
    // 使用类型推断，为此就必须手动指定它的类型为Void
    let observable = Observable<Void>.empty()
    
    // 订阅这个observable实例
    observable.subscribe(
        
        // 处理.next事件
        onNext: { (element) in
        print(element)
    },
       
        // 处理.completed事件
        onCompleted: {
            print("Completed")
    })
}



/// 监听never
example(of: "never") {
    
    let observable = Observable<Any>.never()
    
    observable
        .subscribe(
            onNext: { (element) in
            print(element)
        },
                   
            onCompleted: {
                print("Completed")
        }
    )
}
