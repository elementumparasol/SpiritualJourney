import UIKit
import RxSwift

example(of: "igonreElements") {
    
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    // ignoreElements会忽略.next事件，但是
    // 对于像stop事件(.error或者.completed)
    // 则不会过滤。如果你希望一个Observable在
    // 结束(正常或者非正常结束)之后接收到相应的
    // 通知，那么ignoreElements就能排上用场
    strikes.ignoreElements().subscribe { _ in
        print("You're out!")
    }.disposed(by: disposeBag)
    
    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    
    // .completed事件不会被过滤
    strikes.onCompleted()
}


example(of: "elementAt") {
    
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    // elementAt主要是用来接收第n个事件元素，而对于
    // 其它的，则全部忽略。比如说，我们只接收下标值为2
    // 的事件元素，其它的则全部忽略
    strikes.elementAt(2).subscribe(onNext: { (_) in
        print("You're out!")
    }).disposed(by: disposeBag)
    
    strikes.onNext("A")
    strikes.onNext("B")
    
    // 只接收下标值为2的事件元素
    strikes.onNext("C")
}


example(of: "filter") {
    
    let disposeBag = DisposeBag()
    
    // 创建一个Observable，并且使用filter对其进行过滤
    Observable.of(1, 2, 3)
        .filter({ (integer) -> Bool in
            
            // 过滤出所有小于3的数
            integer < 3
        }).subscribe(onNext: {
            
            // 打印过滤出来的元素
            print($0)
        }).disposed(by: disposeBag)
}


example(of: "skip") {
    
    let disposeBag = DisposeBag()
    
    // 过滤掉Observable可观察序列中前面n个事件
    // 元素，然后再来订阅它后面的所有.next事件
    Observable.of(1, 2, 3, 4, 5)
        .skip(2)  // 过滤掉前面的2个事件元素，然后再订阅
        .subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
}


example(of: "skipWhile") {
    
    let disposeBag = DisposeBag()
    
    // 与skip跳过前面的n个事件元素有所不同，skipWhile
    // 会过滤掉所有满足条件的事件元素，直到有一个事件元素
    // 不满足过滤条件，它就不再继续过滤。即便是该不满足过
    // 滤条件的事件元素后面又有满足过滤条件的事件元素，它
    // 都不再继续过滤。比如说，下面的事件元素1满足过滤条件
    // 所以，它会被过滤掉。但是，它后面的事件元素2不满足过
    // 滤条件，skipWhile到此就停止了，即便是后面的事件元
    // 素3和5都满足过滤条件，但是因为skipWhile已经停止了
    // 所以就不再继续过滤了
    Observable.of(1, 2, 3, 4, 5)
        .skipWhile({ (integer) -> Bool in
        integer % 2 == 1
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
}
