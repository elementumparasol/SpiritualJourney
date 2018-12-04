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


