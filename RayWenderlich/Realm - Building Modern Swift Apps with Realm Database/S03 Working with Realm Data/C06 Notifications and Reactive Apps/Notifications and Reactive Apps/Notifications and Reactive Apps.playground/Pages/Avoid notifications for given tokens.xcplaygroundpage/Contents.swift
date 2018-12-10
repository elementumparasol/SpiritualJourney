import RealmSwift
import PlaygroundSupport

Example.of("Avoid notifications for given tokens")
PlaygroundPage.current.needsIndefiniteExecution = true


// 设置Realm的配置信息
let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")

// 根据指定的配置在内存中创建Realm数据库
let realm = try! Realm(configuration: configuration)

// 创建测试数据集
try! TestDataSet.create(in: realm)


// 获取Realm数据库中Person类型的对象
let people = realm.objects(Person.self)

// 监听集合people中对象数据的更改，并且返回第一个token
let token1 = people.observe { (changes) in
    
    switch changes {
        
    case .initial:
        print("Initial notification for token1")
    case .update:
        print("Change notification for token1")
    default:
        break
    }
}

// 监听集合people中的对象更改，并且返回第二个token
let token2 = people.observe { (changes) in
    
    switch changes {
    case .initial:
        print("Initial notification for token2")
    case .update:
        print("Change notification for token2")
    default:
        break
    }
}

// 开始准备修改集合people中的对象
realm.beginWrite()

// 添加一个Person实例到Realm数据库中
realm.add(Person())

// 将更改提交到Realm数据库中，并且制定token2不接收通知
try! realm.commitWrite(withoutNotifying: [token2])
