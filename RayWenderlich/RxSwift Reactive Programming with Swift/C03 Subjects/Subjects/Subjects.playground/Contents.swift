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
