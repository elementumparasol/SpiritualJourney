import Foundation
import RealmSwift

class Person: Object {
    
    @objc dynamic var name = ""
    
    convenience init(_ name: String) {
        self.init()
        
        self.name = name
    }
}


class RepairShop: Object {
    
    @objc dynamic var name = ""
    
    // 当你与另一个Realm对象创建关系时
    // 其属性必须是Optional类型
    @objc dynamic var contact: Person?
}

class Car: Object {
    
    @objc dynamic var brand = ""
    @objc dynamic var year = 0
    
    // 创建关系，分别指向Person和RepairShop实例
    @objc dynamic var owner: Person?
    @objc dynamic var shop: RepairShop?
    
    // 用于存储Repair对象信息
    let repairs = List<Repair>()
    
    // 汽车牌照
    let plates = List<String>()
    
    // 年检日期
    let checkups = List<Date>()
    
    convenience init(brand: String, year: Int) {
        self.init()
        self.brand = brand
        self.year = year
    }
    
    override var description: String {
        return "Car {\(brand), \(year)}"
    }
}

class Repair: Object {
    
    @objc dynamic var date = Date()
    @objc dynamic var person: Person?
    
    convenience init(by person: Person) {
        self.init()
        self.person = person
    }
}


example(of: "To-one relationships") {
    
    let marin = Person("Marin")
    let jack = Person("Jack")
    
    let myLittleShop = RepairShop()
    myLittleShop.name = "My Little Auto Shop"
    myLittleShop.contact = jack
    
    let car = Car(brand: "BMW", year: 1980)
    car.shop = myLittleShop
    car.owner = marin
    
    print(myLittleShop.contact?.name ?? "no name")
    print(car.shop == myLittleShop)
    print(car.owner!.name)
}


class Vehicle: Object {
    
    @objc dynamic var year = Date.distantPast
    @objc dynamic var isDiesel = false
    
    convenience init(year: Date, isDiesel: Bool) {
        self.init()
        self.year = year
        self.isDiesel = isDiesel
    }
}

class Truck: Object {
    
    @objc dynamic var vehicle: Vehicle?
    @objc dynamic var nrOfGears = 12
    @objc dynamic var nrOfWheels = 16
    
    convenience init(year: Date, isDiesel: Bool, gears: Int, wheels: Int) {
        self.init()
        self.vehicle = Vehicle(year: year, isDiesel: isDiesel)
        nrOfGears = gears
        nrOfWheels = wheels
    }
}


example(of: "To-many relationships(for objects)") {
    
    let jack = Person("Jack")
    let car = Car(brand: "BMW", year: 1980)
    
    // 将指定对象添加到列表末尾
    car.repairs.append(Repair(by: jack))
    
    // 将包含指定对象的序列添加到列表末尾
    car.repairs.append(objectsIn: [
        Repair(by: jack),
        Repair(by: jack),
        Repair(by: jack)
        ])
    
    print("\(car) has \(car.repairs.count) repairs.")
}


example(of: "Adding pointer to the same objects") {
    
    let jack = Person("Jack")
    let repair = Repair(by: jack)
    
    let car = Car(brand: "BMW", year: 2018)
    car.repairs.append(repair)
    car.repairs.append(repair)
    car.repairs.append(repair)
    car.repairs.append(repair)
    
    // 在列表的开头删除指定的对象，但是不会
    // 从管理它们的Realm数据库中删除
    car.repairs.removeFirst()
    
    // 跟removeFirst()方法一样，只不过这个
    // 方法可以指定一个索引参数
    car.repairs.removeFirst(2)
    
    print(car.repairs)
}


example(of: "Adding primitive types to Realm List(s)") {
    
    let car = Car(brand: "Audi", year: 2018)
    car.plates.append("WYZ 201 Q")
    car.plates.append("2MNYC0DZ")
    
    print(car.plates)
    print("Current registration: \(car.plates.last!)")
    
    car.checkups.append(Date(timeIntervalSinceNow: -31557600))
    car.checkups.append(Date())
    
    print(car.checkups)
    print("first: \(car.checkups.first!)")
    print("max: \(car.checkups.max()!)")
}
