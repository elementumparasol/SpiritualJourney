/**
 *      ┌─┐       ┌─┐ + +
 *   ┌──┘ ┴───────┘ ┴──┐++
 *   │                 │
 *   │       ───       │++ + + +
 *   ███████───███████ │+
 *   │                 │+
 *   │       ─┴─       │
 *   │                 │
 *   └───┐         ┌───┘
 *       │         │
 *       │         │   + +
 *       │         │
 *       │         └──────────────┐
 *       │                        │
 *       │                        ├─┐
 *       │                        ┌─┘
 *       │                        │
 *       └─┐  ┐  ┌───────┬──┐  ┌──┘  + + + +
 *         │ ─┤ ─┤       │ ─┤ ─┤
 *         └──┴──┘       └──┴──┘  + + + +
 *                神兽保佑
 *               代码无BUG!
 */




import Foundation
import RealmSwift

// 在内存中创建一个临时的Realm实例
let realm = try! Realm(configuration:
    Realm.Configuration(inMemoryIdentifier: "TemporaryRealm"))

try! TestDataSet.create(in: realm)

print("Ready to play!")


Example.of("Getting All Objects") {
    
    let people = realm.objects(Person.self)
    let articles = realm.objects(Article.self)
    
    print("\(people.count) people and \(articles.count) articles")
}


Example.of("Getting an Object by Primary Key") {
    
    // 根据指定的主键来获取存储在Realm中的对象
    let person = realm.object(ofType: Person.self, forPrimaryKey: "test-key")
    
    if let person = person {
        print("Person with primary key 'test-key': \(person.firstName)")
    } else {
        print("Not found")
    }
}


Example.of("Accessing Results") {
    
    let people = realm.objects(Person.self)
    
    // 通过类似于Swift数组的方法来访问Results
    print("Realm contains \(people.count) people")
    print("First person is \(people.first!.fullName)")
    print("Second person is \(people[1].fullName)")
    print("Last person is \(people.last!.fullName)")
    
    // 还可以通过一些比较高级的方法来访问Results
    let firstNames = people.map { $0.firstName }.joined(separator: ", ")
    print("First name of all people are: \(firstNames)")
    
    let namesAndIds = people.enumerated()
        .map { "\($0.offset): \($0.element.firstName)" }
        .joined(separator: ", ")
    print("People and indexes: \(namesAndIds)")
}


Example.of("Results Indexes") {
    
    let people = realm.objects(Person.self)
    
    // 通过索引获取对象
    let person = people[1]
    
    // 通过对象获取索引
    if let index1 = people.index(of: person) {
        print("\(person.fullName) is at index \(index1)")
    }
    
    // 寻找Results中第一个符合要求的对象的索引
    if let index2 = people.firstIndex(where: { $0.firstName.starts(with: "J") }) {
        print("Name starts with J at index \(index2)")
    }
    
    // 返回第一个与谓词相匹配对象的索引
    if let index3 = people.index(matching: "hairCount < %d", 10000) {
        print("Person with less than 10, 000 hairs at index \(index3)")
    }
}


Example.of("Filtering") {
    
    let people = realm.objects(Person.self)
    print("All People: \(people.count)")
    
    let living = realm.objects(Person.self)
        .filter("deceased = nil")
    print("Living People: \(living.count)")
    
    let predicate = NSPredicate(format: "hairCount < %d AND deceased = nil", 1000)
    let balding = realm.objects(Person.self).filter(predicate)
    print("Likely balding living people: \(balding.count)")
    
    
    let baldingStatic = Person.allAliveLikelyBalding(in: realm)
    print("Likely balding people (via static method): \(baldingStatic)")
}


Example.of("Live Results") {
    
    let people = realm.objects(Person.self)
        .filter("key == 'key'")
    
    // 第一次打印： Found 0 people for key "key"
    print("Found \(people.count) people for key \"key\"")
    
    // 创建新的Person实例，并且设置它的Key
    let newPerson1 = Person()
    newPerson1.key = "key"
    
    // 将新的Person实例存储到数据库中
    try! realm.write {
        realm.add(newPerson1)
    }
    
    // 第二次打印： Found 1 people for key "key"
    print("Found \(people.count) people for key \"key\"")
    
    let newPerson2 = Person()
    newPerson2.key = "key"  // 它的Key和newPerson2相同
    newPerson2.firstName = "Sher"
    
    // 第三次打印： Found 1 people for key "key"
    print("Found \(people.count) people for key \"key\"")
}


Example.of("Writing Objects") {
    
    let people = realm.objects(Person.self)
        .filter("key == 'key'")
    let person = Person()
    person.key = "new"
    
    // 开始写入Realm更改
    realm.beginWrite()
    
    // 在这里进行Realm数据的更改
    
    // 需要回滚更改的时候使用
    // realm.cancelWrite()
    
    // 更改完成以后，提交到Realm
    try! realm.commitWrite()
    
    print("Found \(people.count) people for key \"key\"")
}


Example.of("Cascading Inserts") {
    
    let newAuthor = Person()
    newAuthor.firstName = "New"
    newAuthor.lastName = "Author"
    
    let newArticle = Article()
    
    // newArticle链接到了newAuthor上
    newArticle.author = newAuthor
    
    // 将newArticle添加到Realm中
    // newAuthor也自动被添加到了Realm中
    try! realm.write {
        realm.add(newArticle)
    }
    
    let author = realm.objects(Person.self)
        .filter("firstName = 'New'").first!
    
    // 验证newAuthor是否被添加到了Realm中
    print("Author \"\(author.fullName)\" persisted with article.")
}


Example.of("Updating Objects") {
    
    // 取出需要修改的对象
    let person = realm.objects(Person.self).first!
    
    // 修改前
    print("\(person.fullName) initially - isVIP: \(person.isVIP), allowedPublication: \(person.allowedPublicationOn != nil ? "yes" : "no")")
    
    // 修改对象
    try! realm.write {
        person.isVIP = true
        person.allowedPublicationOn = Date()
    }
    
    // 修改后
    print("\(person.fullName) initially - isVIP: \(person.isVIP), allowedPublication: \(person.allowedPublicationOn != nil ? "yes" : "no")")
}


Example.of("Deleting Objects") {
    
    let people = realm.objects(Person.self)
    
    // 删除前
    print("There are \(people.count) people before deletion: \(people.map { $0.firstName }.joined(separator: ", "))")
    
    // 删除不需要的对象
    try! realm.write {
        realm.delete(people[0])  // 删除单个对象
        realm.delete([people[1], people[5]])  // 删除一个序列
        realm.delete(realm.objects(Person.self).filter("firstName BEGINSWITH 'J'"))  // 通过筛选删除对象
    }
    
    // 删除后
    print("There are \(people.count) people before deletion: \(people.map { $0.firstName }.joined(separator: ", "))")
    
    // 删除所有符合要求的对象
    try! realm.write {
        realm.deleteAll()
    }
    
    // 删除所有符合要求的对象之后
    print("Empty after deletaAll? \(realm.isEmpty)")
}

