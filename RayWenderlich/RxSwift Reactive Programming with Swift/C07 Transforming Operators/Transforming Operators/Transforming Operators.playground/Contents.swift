import UIKit
import RxSwift

example(of: "toArray") {
    
    let disposeBag = DisposeBag()
    
    // 创建可观察序列Observable
    Observable.of("A", "B", "C")
        .toArray()  // 将事件元素转换为数组
        .subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
}


example(of: "map") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3).map({
        $0 * 2  // 每个事件元素的值在原有的基础上乘以2
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
}


example(of: "enumerated and map") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(2, 4, 6, 8, 10)
        .enumerated()
        .map({ index, element in
            
            // 索引值大于2的在原有基础上乘以2，否则原样输出
            index > 2 ? element * 2 : element
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
}


struct Student {
    var score: BehaviorSubject<Int>
}

example(of: "flatMap") {
    
    let disposeBag = DisposeBag()
    let ryan = Student(score: BehaviorSubject(value: 80))
    let Jim = Student(score: BehaviorSubject(value: 90))
    
    let student = PublishSubject<Student>()
    
    student.flatMap({
        $0.score  // 仅仅只是访问，不做任何的修改
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
    
    student.onNext(ryan)
    ryan.score.onNext(85)  // 修改ryan的分数
    student.onNext(Jim)
    ryan.score.onNext(95)
    Jim.score.onNext(100)
}


