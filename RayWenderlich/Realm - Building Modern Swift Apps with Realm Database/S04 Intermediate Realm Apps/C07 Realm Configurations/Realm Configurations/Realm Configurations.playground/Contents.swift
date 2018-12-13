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
