import UIKit
import RxSwift

/// ignoreElements
example(of: "ignoreElements") {
    
    // 创建PublishSubject实例
    let strikes = PublishSubject<String>()
    
    // 创建DisposeBag
    let disposeBag = DisposeBag()
    
    // 订阅strikes
    strikes
    .ignoreElements()  // 忽略所有的events
        .subscribe({ (_) in  // 订阅所有的events
            print("You're out!")
        })
        .disposed(by: disposeBag)
    
    // 向strikes添加.next和.completed事件
    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    strikes.onCompleted()
}
