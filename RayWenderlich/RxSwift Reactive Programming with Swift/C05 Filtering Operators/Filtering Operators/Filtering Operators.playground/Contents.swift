import UIKit
import RxSwift

example(of: "igonreElements") {
    
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    strikes.ignoreElements().subscribe { _ in
        print("You're out!")
    }.disposed(by: disposeBag)
    
    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    
    strikes.onCompleted()
}


example(of: "elementAt") {
    
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    strikes.elementAt(2).subscribe(onNext: { (_) in
        print("You're out!")
    }).disposed(by: disposeBag)
    
    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    strikes.onNext("D")
}
