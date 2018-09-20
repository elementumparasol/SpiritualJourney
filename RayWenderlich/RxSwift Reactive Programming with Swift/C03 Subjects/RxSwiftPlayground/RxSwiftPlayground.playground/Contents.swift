import RxSwift

/// PublishSubject
example(of: "PublishSubject") {
    
    // 创建一个PublishSubject实例，并制定其类型为String
    let subject = PublishSubject<String>()
    
    // 添加一个字符串事件到subject
    // 这个事件不会被打印，因为它是在订阅之前添加的
    subject.onNext("Is anyone listening?")
    
    // 创建一个subscription来订阅subject
    let subscriptionOne = subject.subscribe(onNext: { (string) in
        print(string)
    })
    
    // 再次添加一个.next事件到subject
    subject.on(.next("1"))
    
    // 接着再添加一个.next事件到subject
    subject.onNext("2")
    
    
    // 再创建一个subscription来订阅subject
    let subscriptionTwo = subject.subscribe({event in
        print("subscriptionTwo:", event.element ?? event)
    })
    
    // 添加一个事件到subject，这样subscriptionOne
    // 和subscriptionTwo都可以订阅它
    subject.onNext("3")
    
    // 终止subscriptionOne的订阅
    subscriptionOne.dispose()
    
    subject.onNext("4")
    
    
    // 添加一个.completed事件到subject
    // 这样一来subscriptionTwo就不能订阅后面的事件5了
    subject.onCompleted()
    
    // 添加一个.next事件到subject中
    subject.onNext("5")
    
    // 终止subscriptionTwo的订阅
    // 注意，虽然上面已经完成了subject的订阅
    // 但是订阅行为并没有完全终止，为了防止内存
    // 泄漏，这里还需要手动调用dispose()方法来终止订阅
    subscriptionTwo.dispose()
    
    let disposeBag = DisposeBag()
    
    // 创建一个新的subscription来订阅subject
    // 因为我们在上面第42行代码中手动结束了整个subject
    // 所以，即便是后来再创建新的subscription来订阅subject
    // 我们所能收到的依然是.completed事件(类似于指针死，不覆生)
    subject
    .subscribe({
        print("3)", $0.element ?? $0)
    })
    .disposed(by: disposeBag)
    
    // 添加新的.next事件到subject
    // 因为之前在第42行已经停止了subject，所以尽管
    // 这个事件在新的订阅之后，但是它仍然不会被打印
    subject.onNext("?")
    
}





/// BehaviorSubject

// 自定义错误枚举
enum MyError: Error {
    case anError
}

// 自定义一个print函数
func print<T: CustomStringConvertible>(label: String, event: Event<T>) {
    
    // 如果element存在，则打印element；
    // 如果element不存在，但是error存在，则打印error；
    // 如果element和error都不存在，则打印event
    print(label, (event.element ?? event.error) ?? event)
}

example(of: "BehaviorSubject") {
    // 创建BehaviorSubject实例
    // 因为BehaviorSubject实例总是会释放最新的element，因此
    // 在创建BehaviorSubject实例时，必须给它提供一个初始化值
    let subject = BehaviorSubject(value: "Initial Value")
    
    // 创建DisposeBag实例
    let disposeBag = DisposeBag()
    
    // 往subject中添加新的.next事件
    // 这次事件"X"是最新的事件，所以会打印"X"，而不会打印"Initial Value"
    subject.onNext("X")  // 注意，这句代码是在创建完订阅之后才插入的
    
    // 订阅subject
    // 虽然这个subscription是在subject添加初始element之后
    // 才订阅的，但是因为BehaviorSubject总是能收到最新的event
    // 所以，我们这里依然能打印"Initial Value"事件
    subject
    .subscribe({
        print(label: "1)", event: $0)
    })
    .disposed(by: disposeBag)
    
    // 添加一个.error事件到subject
    // 因为对于上面那个subscription来说，这次新添加的.error
    // 事件是最新的，因为它会在"1)"中被打印一次；另外，对于下面
    // 新添加的subscription "2)"来说，这个.error事件也是最新
    // 的，所以，它在"2)"中同样也会被打印
    subject.onError(MyError.anError)
    
    // 再创建一个subscription来订阅subject
    subject
    .subscribe({
        print(label: "2)", event: $0)
    })
    .disposed(by: disposeBag)
}





/// ReplaySubject
example(of: "ReplaySubject") {
    
    // 创建ReplaySubject实例，并且设置它的bufferSize为2
    let subject = ReplaySubject<String>.create(bufferSize: 2)
    
    let disposeBag = DisposeBag()
    
    // 像subject添加若干.next事件
    subject.onNext("A")
    subject.onNext("B")
    subject.onNext("C")
    
    // 创建一个subscription来订阅subject
    subject
    .subscribe({
        print(label: "1)", event: $0)
        })
    .disposed(by: disposeBag)
    
    // 再创建一个新的subscription来订阅subject
    subject
    .subscribe {
        print(label: "2)", event: $0)
    }
    .disposed(by: disposeBag)
    
    // 因为我们在创建subject的时候，预设它的bufferSize为2
    // 因此，尽管我们连续创建了3个.next事件，但是它只能订阅
    // 最新的两个。再添加一个.next事件到subject
    subject.onNext("D")
    
    // 向subject添加一个.error事件
    subject.onError(MyError.anError)
    
    // 终止订阅
    // 注意，一般情况下，像这样显示的调用dispose()方法，在
    // 实际开发过程中并不常见。因为我们在创建订阅的时候，已经
    // 将它添加到DisposeBag中去了(避免创建强循环引用)，当
    // 订阅的拥有者被释放时，那么所有和订阅相关的资源同样都会
    // 被释放。
    subject.dispose()
    
    // 再来创建一个subscription来订阅subject
    // 如果前面已经终止订阅了，那么第3个订阅便不会再打印
    subject
    .subscribe {
        print(label: "3)", event: $0)
    }
    .disposed(by: disposeBag)
}





/// Variable
example(of: "Variable") {
    
    // 创建Variable实例
    let variable = Variable("Initial Value")
    
    let disposeBag = DisposeBag()
    
    // 向variable添加一个新的element
    // 注意，variable跟其它的subject有所不同，我们
    // 不用通过调用onNext(_: )方法来添加.next事件，
    // 而是直接通过它的value属性来添加。另外，由于variable
    // 不会释放错误，因此也不用向它添加.error事件。最后，
    // variable在即将被释放之前，会自动完成，因此，我们也
    // 不用手动向它添加.completed事件
    variable.value = "A new initial value"
    
    // 订阅variable
    // 首先，调用asObervable()方法来访问其底层的BehaviorSubject
    // 然后再像订阅其它类型的subject一样的订阅variable
    variable.asObservable()
    .subscribe {
        print(label: "1)", event: $0)
    }
    .disposed(by: disposeBag)
    
    
    variable.value = "1"
    
    variable.asObservable()
        .subscribe {
            print(label: "2)", event: $0)
        }
        .disposed(by: disposeBag)
    
    variable.value = "2"
    
    /**
     必须记住: 任何试图通过手动的方式来添加.error或者
     .completed事件到Variable实例中的做法，都会引发
     编译错误!
     */
}
