import UIKit
import RxSwift

example(of: "Share subscriptions") {
    
    var start = 0
    func getStartNumber() -> Int {
        start += 1
        return start
    }
    
    let disposeBag = DisposeBag()
    
    // 使用create函数来创建Observable
    let numbers = Observable<Int>.create({ (observer) -> Disposable in
        
        let start = getStartNumber()
        observer.onNext(start)
        observer.onNext(start + 1)
        observer.onNext(start + 2)
        observer.onCompleted()
        
        return Disposables.create()
    })
    
    // 订阅numbers
    numbers.subscribe(onNext: { (element) in
        print("element [\(element)]")
    }, onCompleted: {
        print("--- Completed! ---")
    }).disposed(by: disposeBag)
    
    // 再次订阅numbers
    numbers.share().subscribe(onNext: { (element) in
        print("element [\(element)]")
    }, onCompleted: {
        print("--- Completed! ---")
    }).disposed(by: disposeBag)
}
