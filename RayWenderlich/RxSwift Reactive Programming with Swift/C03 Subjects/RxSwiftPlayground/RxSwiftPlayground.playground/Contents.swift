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
