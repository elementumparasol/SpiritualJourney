import UIKit
import RxSwift


/// toArray
example(of: "toArray") {
    
    let disposeBag = DisposeBag()
    
    Observable.of("A", "B", "C")
    
        // 通过调用toArray()方法，将elements
        // 包装成数组
        .toArray()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



/// map
example(of: "map") {
    
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    // 创建一个NSNumber类型的Observable
    Observable<NSNumber>.of(123, 4, 56)
    
        // 通过map函数将数字类型转换为对应的字符串类型
        .map({
            formatter.string(from: $0) ?? ""
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



/// enumerated and map
example(of: "enumerated and map") {
    
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .enumerated()
        .map({ (index, integer) -> Int in
            index > 2 ? integer * 2 : integer
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}



struct Student {
    var score: BehaviorSubject<Int>
}

/// flatMap
example(of: "flatMap") {
    
    let disposeBag = DisposeBag()
    
    // 创建两个Student实例变量
    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotter = Student(score: BehaviorSubject(value: 90))
    
    // 创建一个类型为Student的Source subject
    let student = PublishSubject<Student>()
    
    student
        .flatMap({
            $0.score
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(ryan)
    ryan.score.onNext(85)
    student.onNext(charlotter)
    ryan.score.onNext(95)
    charlotter.score.onNext(100)
}




/// flatMapLatest
example(of: "flatMapLatest") {
    
    let disposeBag = DisposeBag()
    
    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))
    
    let student = PublishSubject<Student>()
    
    student
        .flatMapLatest({
            $0.score
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(ryan)
    ryan.score.onNext(85)
    
    student.onNext(charlotte)

    ryan.score.onNext(95)
    charlotte.score.onNext(100)
}




/// materialize and dematerialize
example(of: "materialize and dematerialize") {
    
    // 自定义错误枚举常量
    enum MyError: Error {
        
        /// 发生错误
        case anError
    }
    
    let disposeBag = DisposeBag()
    
    let ryan = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 100))
    
    let student = BehaviorSubject(value: ryan)
    
    // 使用flatMapLatest创建studentScore Observable
    // 以便观察它的score属性
    let studentScroe = student
        .flatMapLatest({
            $0.score.materialize()
        })
    
    // 订阅studentScore，然后打印score
    studentScroe
        // 打印并过滤掉error
        .filter({
            guard $0.error == nil else {
                print($0.error!)
                return false
            }
            
            return true
        })
        // 使用dematerialize()返回studentScore这个
        // Observable的原始形式
        .dematerialize()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    // 添加score、error和其它score到Student实例ryan中
    ryan.score.onNext(85)
    ryan.score.onError(MyError.anError)
    ryan.score.onNext(90)
    
    // 将另外一个Student实例charlotte添加到
    // 当前的student中
    student.onNext(charlotte)
}
