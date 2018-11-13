import UIKit
import RxSwift

example(of: "PublishSubject") {
    
    // 创建一个String类型的PublishSubject实例
    let subject = PublishSubject<String>()
    
    // 添加一个.next事件
    subject.onNext("This message won't be listened to.")
    
    // 订阅subject
    subject.subscribe(onNext: { string in
        
        // 打印接收到的事件消息
        print(string)
    })
    
    // "1"会被打印，因为它是在订阅之后添加的事件
    subject.on(.next("1"))
    subject.onNext("This message will be listened to.")
}


example(of: "PublishSubject") {
    
    // 创建PublishSubject实例
    let subject = PublishSubject<Int>()
    
    // 向subject添加事件1
    subject.onNext(1)
    
    // 第一位订阅者
    let subscriber1 = subject.subscribe(onNext: { element in
        print("第一位订阅者: \(element)")
    }, onCompleted: {
        print("第一位订阅者: Completed")
    })
    
    // 向subject添加事件2
    subject.onNext(2)
    
    // 第二位订阅者
    let subscriber2 = subject.subscribe(onNext: { element in
        print("第二位订阅者: \(element)")
    }, onCompleted: {
        print("第二位订阅者: Completed")
    })
    
    // 向subject添加事件3
    subject.onNext(3)
    
    // 调用dispose()，表示第一位订阅者已经完成了
    // 所以，它无法再接收到后面添加的事件了
    subscriber1.dispose()

    // 第二位订阅者还未完成，所以它可以接收事件4
    subject.onNext(4)
    
    // 向subject添加.completed事件，则表示subject
    // 已经顺利完成任务，然后停止了。subject只会向当前
    // 和未来的订阅者发送.completed事件，其它任何事件
    // 均无法发送
    subject.onCompleted()
    
    // 由于第一位订阅者已经完成了，所以它不能接收任何事件，
    // 包括.completed事件。但是，第二位订阅者还没有完成，
    // 所以它可以接收subject发出的.completed事件，但是
    // 无法接收后面新添加的事件5
    subject.onNext(5)
    subscriber2.dispose()
    
    let disposeBag = DisposeBag()

    // 再创建一个新的订阅者
    subject.subscribe {
        print("A new subscription:", $0.element ?? $0)
    }.disposed(by: disposeBag)

    // 新的订阅者无法再接收到事件6了。因为在代码第65行
    // 已经添加了.completed事件。所以，即便我们后来
    // 又创建了新的订阅者，它也只能收到之前发出的completed事件
    subject.onNext(6)
}


/// 自定义额错误类型
enum MyError: Error {
    case anError
}

/// 自定义print函数，用来打印相关描述信息和event
///
/// - Parameters:
///   - description: 用于描述的信息
///   - event: Subject的event事件
func print<T: CustomStringConvertible>(description: String, event: Event<T>) {
    
    // 如果element存在，则打印element；
    // 如果element不存在，但是error存在，则打印error；
    // 如果element和error都不存在，则打印event
    print(description, (event.element ?? event.error) ?? event)
}

example(of: "BehaviorSubject") {
    
    // 创建BehaviorSubject实例，并且设置初始值
    let subject = BehaviorSubject(value: 1)
    let disposeBag = DisposeBag()
    
    // 第一个订阅者从subject发出事件1之后开始订阅
    subject.subscribe({
        print(description: "第一个订阅者:", event: $0)
    }).disposed(by: disposeBag)
    
    // 事件2
    subject.onNext(2)
    
    // 第二个订阅者是从事件2之后才开始订阅
    subject.subscribe({
        print(description: "第二个订阅者:", event: $0)
    }).disposed(by: disposeBag)
    
    // 事件3
    subject.onNext(3)}
