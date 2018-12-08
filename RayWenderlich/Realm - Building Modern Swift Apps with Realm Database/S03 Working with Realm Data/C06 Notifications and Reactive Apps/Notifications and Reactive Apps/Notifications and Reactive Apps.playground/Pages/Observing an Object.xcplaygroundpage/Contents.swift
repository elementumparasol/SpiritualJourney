import Foundation
import RealmSwift
import PlaygroundSupport

Example.of("Observing an Object")
PlaygroundPage.current.needsIndefiniteExecution = true


// 设置Realm的配置选项(在内存中安装Realm)
let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")

// 根据配置选项来安装Realm
let realm = try! Realm(configuration: configuration)

// 创建一个Article实例，并且设置它的id
let article = Article()
article.id = "new-article"

// 将实例article添加到Realm中
try! realm.write {
    realm.add(article)
}

// 监听article的改变
// observe(_ block: @escaping (ObjectChange) -> Void) -> NotificationToken
let token = article.observe { (change) in
    
    switch change {
    case .change(let properties):
        for property in properties {
            switch property.name {
            case "title":
                print("📝 Article title changed from \(property.oldValue ?? "nil") to \(property.newValue ?? "nil")")
            case "author":
                print("👤 Author changed to \(property.newValue ?? "nil")")
            default:
                break
            }
        }
        
        if properties.contains(where: { $0.name == "date" }) {
            print("Date has changed to \(article.date)")
        }
    case .error(let error):
        print("Error occurred: \(error)")
    case .deleted:
        print("Article was deleted.")
    }
}

print("Subscription token: \(token)")


// 修改article实例的某个属性
try! realm.write {
    article.title = "Work in progress"
}


DispatchQueue.global(qos: .background).async {
    
    // 使用与上面完全相同的配置信息来创建一个Realm实例
    let realm = try! Realm(configuration: configuration)
    
    // 通过指定的primaryKey来取出article它的title和author属性
    if let article = realm.object(ofType: Article.self, forPrimaryKey: "new-article") {
        try! realm.write {
            article.title = "Article title"  // 修改title属性
            article.author = Person()  // 修改author属性
        }
    }
}
