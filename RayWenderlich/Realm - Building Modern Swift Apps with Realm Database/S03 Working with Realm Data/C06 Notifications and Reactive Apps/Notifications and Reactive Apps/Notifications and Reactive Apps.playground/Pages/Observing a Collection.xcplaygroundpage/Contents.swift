import Foundation
import RealmSwift
import PlaygroundSupport

Example.of("Observing a Collection")
PlaygroundPage.current.needsIndefiniteExecution = true

// 设置Realm的配置信息
let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")

// 根据指定的配置在内存中创建一个Realm实例
let realm = try! Realm(configuration: configuration)

// 创建测试数据集(里面包含Article、Person和Author实例)
try! TestDataSet.create(in: realm)

// 取出所有类型为Person的对象，并且按照firstName对结果进行排序
let people = try! realm.objects(Person.self)
    .sorted(byKeyPath: "firstName")

// 监听集合people的更改
let token = people.observe { (changes) in
    
    print("Current count: \(people.count)")
}


// 创建两个Person实例，并且将其添加到Realm中
try! realm.write {
    realm.add(Person())
    realm.add(Person())
}


// 通过GCD创建一个同步的后台队列
DispatchQueue.global(qos: .background).sync {
    let realm = try! Realm(configuration: configuration)
    try! realm.write {
        realm.add(Person())
    }
}


// 移除订阅通知
DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
    token.invalidate()
}


// 因为通知已经被移除了，因此再改变集合时，不会收到任何通知
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    try! realm.write {
        realm.add(Person())
    }
}
