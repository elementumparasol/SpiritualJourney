import UIKit
import RealmSwift


Example.of("New configuration") {
    
    // 创建默认的配置文件
    let configuration = Realm.Configuration()
    
    // 打印默认的配置信息
    print(configuration)
}
