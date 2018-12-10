import RealmSwift
import PlaygroundSupport

Example.of("Realm wide notifications")
PlaygroundPage.current.needsIndefiniteExecution = true


// 设置Realm安装配置信息
let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")

// 在内存中创建Realm数据库
let realm = try! Realm(configuration: configuration)

// 监听整个Realm数据库的通知
let token = realm.observe { (notification, realm) in
    print(notification)
}

// 提交一个空的write处理
try! realm.write { }
