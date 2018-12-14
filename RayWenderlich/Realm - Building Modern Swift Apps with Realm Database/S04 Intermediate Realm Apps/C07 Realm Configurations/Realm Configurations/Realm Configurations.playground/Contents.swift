import UIKit
import RealmSwift


Example.of("New configuration") {
    
    // 创建默认的配置文件
    let configuration = Realm.Configuration()
    
    // 打印默认的配置信息
    print(configuration)
}


Example.of("Default configuration") {
    
    // 获取默认的配置
    let defaultConfiguration = Realm.Configuration
        .defaultConfiguration
    
    // 打印默认的配置信息
    print(defaultConfiguration)
}


Example.of("Custom Configuration") {
    
    var defaultConfig = Realm.Configuration
        .defaultConfiguration
    
    print(defaultConfig.schemaVersion)
    
    // 更改schemaVersion(UInt64)
    defaultConfig.schemaVersion = 1
    
    Realm.Configuration.defaultConfiguration = defaultConfig
    
    print(defaultConfig.schemaVersion)
}


Example.of("In-Memory Configuration") {
    
    let memoryConfig1 = Realm.Configuration(inMemoryIdentifier: "InMemoryIdentifier1")
    // print(memoryConfig1)
    
    let memoryConfig2 = Realm.Configuration(inMemoryIdentifier: "InMemoryIdentifier2")
    // print(memoryConfig2)
    
    let realm1 = try! Realm(configuration: memoryConfig1)
    let people1 = realm1.objects(Person.self)
    try! realm1.write {
        realm1.add(Person())
    }
    print("People (1): \(people1.count)")

    let realm2 = try! Realm(configuration: memoryConfig2)
    let people2 = realm2.objects(Person.self)
    print("People (2): \(people2.count)")
}


Example.of("Documents folder") {
    
    // 在Documents目录下面自定义一个文件路径
    let documentsURL = try! FileManager.default
        .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("myRealm.realm")
    
    // 在沙盒中的Documents文件夹下面创建Realm文件
    let documentsConfig = Realm.Configuration(fileURL: documentsURL)
    print("Documents-folder Realm in: \(documentsConfig)")
}


Example.of("Library folder") {
    
    let libraryURL = try! FileManager.default
        .url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("myRealm.realm")
    let libraryConfig = Realm.Configuration(fileURL: libraryURL)
    print("Realm in library folder: \(libraryConfig)")
}
