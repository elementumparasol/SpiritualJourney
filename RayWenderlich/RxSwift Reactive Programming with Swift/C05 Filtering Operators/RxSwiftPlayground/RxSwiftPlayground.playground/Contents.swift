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



/// elementAt
example(of: "elementAt") {
    
    let strikes = PublishSubject<String>()
    
    let disposeBag = DisposeBag()
    
    strikes
        .elementAt(2)
        .subscribe(onNext: { (_) in
            print("You're out!")
        })
        .disposed(by: disposeBag)
    
    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    strikes.onNext("D")
    strikes.onCompleted()
}



/// filter
example(of: "filter") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .filter({ (integer) -> Bool in  // 过滤出偶数
            integer % 2 == 0
        })
        .subscribe(onNext: {  // 订阅
            print($0)
        })
        .disposed(by: disposeBag)
}
