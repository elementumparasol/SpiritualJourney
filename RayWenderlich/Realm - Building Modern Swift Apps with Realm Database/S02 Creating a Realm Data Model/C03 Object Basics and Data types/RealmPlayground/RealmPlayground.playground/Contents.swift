import Foundation
import RealmSwift
import CoreLocation

// init(configuration: Realm.Configuration)
// 通过指定的配置获取Realm实例
let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "TemporaryRealm"))

print("Ready to play...")


// 创建一个继承自Realm基类Object的Car类
// 而Object最终又是继承的NSObject的，因
// 此，这个类最终会被当做Objective-C的方
// 式去处理，所以属性前面要加上关键字dynamic
class Car: Object {
    
    // Car类的属性。关键字dynamic和@objc可以确保
    // 在运行时通过动态调度的方式来访问这些属性
    @objc dynamic var brand = ""
    @objc dynamic var year = 0
    
    // Car类的便利构造方法(用于创建Car实例对象)
    convenience init(brand: String, year: Int) {
        self.init()
        
        // 初始化属性
        self.brand = brand
        self.year = year
    }
    
    override var description: String {
        return "🚗 {\(brand), \(year)}"
    }
}


Example.of("Basic Model") {
    
    let car = Car(brand: "BMW", year: 1980)
    print(car)
}
