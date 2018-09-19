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



/// range
example(of: "range") {
    
    // 创建Observable实例
    let observable = Observable<Int>.range(start: 1, count: 10)
    
    // 监听observable
    observable
        .subscribe(onNext: { (i) in
            
            let n = Double(i)
            let fibonacci = Int((pow(1.61803, n) - pow(0.61803, n)) / 2.23606.rounded())
            
            print(fibonacci)
        }
    )
}



/// dispose
example(of: "dispose") {
    
    let observable = Observable.of("A", "B", "C")
    
    // 监听observable，并且将其返回值保存到subscription中
    let subcription = observable.subscribe({event in
        print(event)
    })
    
    // 调用dispose()方法，取消订阅
    subcription.dispose()
}



/// DisposeBag
/// 在订阅完成时，或者因为某种原因而导致订阅终止时，
/// 如果你忘记将一个订阅的返回值添加到DisposeBag，
/// 或者说忘记手动调用dispose()方法，那么就会导致
/// 内存泄漏问题
example(of: "DisposeBag") {
    
    // 创建一个DisposeBag实例
    let disposeBag = DisposeBag()
    
    // 创建一个Observable实例
    Observable.of("A", "B", "C")
    .subscribe({  // 订阅Observable实例
        print($0)
    })
    .disposed(by: disposeBag)  // 将订阅的返回值添加到disposeBag中
}



/// create
example(of: "create") {
    
    enum MyError: Error {
        case anError
    }
    
    
    // 创建DisposeBag实例
    let disposeBag = DisposeBag()
    
    // 创建Observable实例
    Observable<String>.create({ (observer) -> Disposable in
        
        // 添加一个.next事件到observer
        observer.onNext("1")
        
        // 添加一个.error事件
        observer.onError(MyError.anError)
        
        // 添加一个.completed事件到observer
        observer.onCompleted()
        
        // 再添加一个.next事件到observer
        // 因为上面有一个.completed事件，所以
        // 这个.next事件永远都不会发生
        observer.onNext("?")
        
        // 最后返回一个disposable
        // Disposables.create()是一个空的disposable
        // 这一步看起来或许有些奇怪，但是请记住，订阅(subscribe)
        // 操作返回一个disposable来表示订阅
        //
        return Disposables.create()
    })
    .subscribe(  // 订阅observable
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") }
    )
    .disposed(by: disposeBag)  // 将订阅的返回值添加到disposeBag
    
}



/// deferred
example(of: "deferred") {
    
    let disposeBag = DisposeBag()
    
    // 创建一个Bool标识符
    var flip = false
    
    // 使用deferred(_: )方法创建一个Int类型的Observable实例
    let factory: Observable<Int> = Observable.deferred({
        
        // 反转(逆置)flip的值
        flip = !flip
        
        // 根据flip的不同值来返回不同的结果
        if flip {
            return Observable.of(1, 2, 3)
        } else {
            return Observable.of(4, 5, 6)
        }
    })
    
    // 订阅factory4次
    for _ in 0...3 {
        factory.subscribe(onNext: {
            print($0, terminator: "")
        })
        .disposed(by: disposeBag)
        
        print()
    }
}
