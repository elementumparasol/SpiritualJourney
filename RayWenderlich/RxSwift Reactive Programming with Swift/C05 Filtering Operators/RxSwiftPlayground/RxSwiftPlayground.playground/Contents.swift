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



/// skip
example(of: "skip") {
    
    let disposeBag = DisposeBag()
    
    Observable.of("A", "B", "C", "D", "E", "F")
        .skip(3)  // 跳过前三个.next事件
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



/// skipWhile
example(of: "skipWhile") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(2, 2, 3, 4, 4)
        .skipWhile({ integer in  // 跳过所有的偶数，直到
            integer % 2 == 0  // 遇到奇数为止
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



/// skipUntil
example(of: "skipUntil") {
    
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .skipUntil(trigger)  // 一直过滤，直到trigger之后
        .subscribe(onNext: {  // 就不再跳过了
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("A")
    subject.onNext("B")
    trigger.onNext("X")  // trigger之前的都会被跳过
    subject.onNext("C")
    subject.onNext("D")
}




/// take
example(of: "take") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .take(3)  // 获取前三个.next事件
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



/// takeWhile
example(of: "takeWhile") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(2, 2, 4, 4, 6, 6)
        .enumerated()  // 枚举出.next所对应的index和value
        .takeWhile({ (index, integer) -> Bool in
            
            // 获取偶数元素，并且下标要小于3
            integer % 2 == 0 && index < 3
        })
        .map { $0.element }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



/// takeUntil
example(of: "takeUntil") {
    
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .takeUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("A")
    subject.onNext("B")
    trigger.onNext("X")  // 获取subject中的事件，直到trigger
    subject.onNext("C")
    subject.onNext("D")
}




/// distinctUntilChanged
example(of: "distinctUntilChanged") {
    
    let disposeBag = DisposeBag()
    
    Observable.of("A", "A", "B", "B", "A", "B")
        
        // 使用distinctUntilChanged()防止连续重复的事件
        // 第2个A会被阻止，第2个B也会被阻止
        .distinctUntilChanged()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    
}




/// distinctUntilChanged(_ : )
example(of: "distinctUntilChanged(_: )") {

    let disposeBag = DisposeBag()
    
    // 创建数字拼写格式，用于拼写数字
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    // 创建类型为NSNumber的Observable实例
    Observable<NSNumber>.of(10, 100, 20, 200, 210, 310)
    
        // 调用distinctUntilChanged(_:)方法。该方法返
        // 回一个可观察序列，并且序列中包含连续的可比较的元素
        .distinctUntilChanged({ (a, b) -> Bool in
            
            // 使用guard来绑定由空格分割的元素组件
            // 如果绑定失败，则返回false
            guard let aWords = formatter.string(from: a)?.components(separatedBy: " "),
                let bWords = formatter.string(from: b)?.components(separatedBy: " ") else {
                    return false
            }
            
            var containsMatch = false
            
            // 分别遍历aWords和bWords
            for aWord in aWords {
                for bWord in bWords {
                    if aWord == bWord {
                        containsMatch = true
                        break
                    }
                }
            }
            
            return containsMatch
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

