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



class Person: Object {
    
    // 对象类型 - String Type
    @objc dynamic var firstName = ""
    @objc dynamic var lastName: String?
    
    // 对象类型 - Date Type
    @objc dynamic var born = Date.distantPast
    @objc dynamic var deceased: Date?
    
    // 对象类型 - Data Type
    @objc dynamic var photo: Data?
    
    
    // 原始类型 - Bool
    @objc dynamic var isVIP: Bool = false
    let allowsPublication = RealmOptional<Bool>()
    
    // 原始类型 - Int
    @objc dynamic var id = 0
    @objc dynamic var hairCount: Int64 = 0
    
    // 原始类型 - Float
    @objc dynamic var height: Float = 0.0
    @objc dynamic var weight = 0.0  // Double类型
    
    
    // 自定义类型 - 使用计算属性来自定义类型
    private let lat = RealmOptional<Double>()
    private let lng = RealmOptional<Double>()
    var lastLocation: CLLocation? {
        
        get {
            guard let lat = lat.value,
                let lng = lng.value else {
                    return nil
            }
            
            return CLLocation(latitude: lat, longitude: lng)
        }
        
        set {
            
            guard let location = newValue?.coordinate else {
                lat.value = nil
                lng.value = nil
                return
            }
            
            lat.value = location.latitude
            lng.value = location.longitude
        }
    }
    
    // 自定义类型 - 枚举
    enum Department: String {
        case technology
        case politics
        case business
        case health
        case science
        case sports
        case travel
    }
    @objc dynamic private var _department = Department.technology.rawValue
    var department: Department {
        get { return Department(rawValue: _department)! }
        set { _department = newValue.rawValue }
    }
    
    
    // 计算属性 - 没有setter，Realm不会对其进行管理
    var isDeceased: Bool {
        return deceased != nil
    }
    
    var fullName: String {
        
        guard let last = lastName else {
            return firstName
        }
        
        return "\(firstName) \(last)"
    }
    
    
    // 便利初始化方法(有些有默认值的属性在这里就没有再次初始化)
    convenience init(firstName: String, born: Date, id: Int) {
        self.init()
        self.firstName = firstName
        self.born = born
        self.id = id
    }
    
    
    // 设置对象的主键(重写此方法以指定要用作主键的属性的名称)
    @objc dynamic var key = UUID().uuidString
    override static func primaryKey() -> String {
        return "key"
    }
    
    
    // 设置索引属性
    override static func indexedProperties() -> [String] {
        return ["firstName", "lastName"]
    }
    
    
    // 忽略属性(Ignored Properties)
    let idPropertyName = "id"  // let类型无法更改，没有setter
    var temporaryId = 0  // 有setter，但是没有@objc和dynamic
    
    @objc dynamic var temporaryUploadId = 0
    override static func ignoredProperties() -> [String] {
        return ["temporaryUploadId"]
    }
}

