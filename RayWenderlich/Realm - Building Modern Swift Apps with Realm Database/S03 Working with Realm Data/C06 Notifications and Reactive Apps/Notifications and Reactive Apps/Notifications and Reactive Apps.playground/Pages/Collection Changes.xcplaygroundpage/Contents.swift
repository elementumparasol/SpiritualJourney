import RealmSwift
import PlaygroundSupport

Example.of("Collection Changes")
PlaygroundPage.current.needsIndefiniteExecution = true

// 设置Realm的配置信息
let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")

// 根据指定的配置信息创建Realm实例
let realm = try! Realm(configuration: configuration)

// 创建测试数据集
try! TestDataSet.create(in: realm)

// 创建一个Article实例，并且设置它的title属性
let article = Article()
article.title = "New Article"

// 将article实例添加到Realm中
try! realm.write {
    realm.add(article)
}

// 监听article的变化
let token = article.people.observe { (changes) in
    
    switch changes {
        
    case .initial(let people):
        print("Initial count: \(people.count)")
    case .update(let people, let deletions, let insertions, let updates):
        print("Current count: \(people.count)")
        print("Inserted \(insertions), Updated \(updates), Deleted \(deletions)")
    case .error(let error):
        print("Error: \(error)")
    }
}


// 往Realm中添加新的对象
try! realm.write {
    article.people.append(Person())
    article.people.append(Person())
    article.people.append(Person())
}


// 修改下标值为1的对象
try! realm.write {
    article.people[1].isVIP = true
}


// 删除下标值为1的对象
try! realm.write {
    article.people.remove(at: 2)
}


// 在执行新的操作之前，集合中目前还有两个对
// 象。接着，在下标值为1的地方插入一个新的
// 对象，然后再删除下标值为0的对象，最后再
// 修改下标值为1的对象的属性
try! realm.write {
    article.people.insert(Person(), at: 1)
    article.people.remove(at: 0)
    article.people[1].firstName = "Lily"
}


// 删除所有对象
try! realm.write {
    article.people.removeAll()
}
