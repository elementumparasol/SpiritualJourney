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
    Observable.of(1, 1, 2, 3, 5, 8)
        .skipWhile({ (integer) -> Bool in
        integer % 2 == 1
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
}


example(of: "skipUntil") {
    
    let disposeBag = DisposeBag()
    
    // 第一个Observable，也就是被订阅的那个
    let subject = PublishSubject<String>()
    
    // 第二个Observable，不会被订阅
    let trigger = PublishSubject<String>()
    
    subject.skipUntil(trigger)
        .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
    
    subject.onNext("A")
    subject.onNext("B")
    
    // subject在这之后发出的事件元素会被订阅者接收到
    trigger.onNext("X")
    
    subject.onNext("C")
    subject.onNext("D")
}


example(of: "take") {

    let disposeBag = DisposeBag()

    // take是和skip相反的操作，也就是说，它
    // 会接收前n个事件元素，跳过后面的所有元素
    Observable.of(1, 2, 3, 4, 5, 6)
        .take(3).subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
}


example(of: "takeWhile") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .takeWhile({ (integer) -> Bool in
        integer < 3
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
}


example(of: "takeWhile") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(2, 2, 4, 4, 6, 6)
        .enumerated().takeWhile({ (index, integer) -> Bool in
            integer % 2 == 0 && index < 3
        }).map({ (_, element) -> Int in
            return element
        }).subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
}


example(of: "takeUntil") {
    
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject.takeUntil(trigger)
        .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
    
    subject.onNext("A")
    subject.onNext("B")
    
    // 订阅者会接收subject发出的所有事件元素
    // 一直到trigger发出一个.next事件元素以
    // 后，订阅者就不再接收subject发出的任何事件元素
    trigger.onNext("X")
    
    subject.onNext("C")
    subject.onNext("D")
}


example(of: "distinctUntilChanged") {
    
    let disposeBag = DisposeBag()
    
    // 连续且重复的事件元素会被过滤掉
    Observable.of(1, 2, 2, 1, 5)
        .distinctUntilChanged()
        .subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
}


example(of: "distinctUntilChanged(_ :)") {

    let disposeBag = DisposeBag()

    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut

    Observable<NSNumber>.of(10, 110, 20, 200, 210, 310)
        .distinctUntilChanged({ (a, b) -> Bool in

            guard let aWords = formatter
                .string(from: a)?
                .components(separatedBy: " "),
                let bWords = formatter
                    .string(from: b)?
                    .components(separatedBy: " ")
                else { return false }

            var containsMatch = false

            for aWord in aWords {
                for bWord in bWords {
                    if aWord == bWord {
                        containsMatch = true
                        break
                    }
                }
            }

            return containsMatch
        }).subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
}



