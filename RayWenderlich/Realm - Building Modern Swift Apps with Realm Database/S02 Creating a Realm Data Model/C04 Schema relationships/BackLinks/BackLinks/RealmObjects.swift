//
//  RealmObjects.swift
//  BackLinks
//
//  Created by Enrica on 2018/12/5.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation
import RealmSwift

class RepairShop: Object {
    @objc dynamic var name = ""
    @objc dynamic var contact = ""
    
    let maintainedCars = LinkingObjects(fromType: Car.self, property: "shop")
    
    convenience init(_ name: String) {
        self.init()
        self.name = name
    }
}

class Car: Object {
    @objc dynamic var brand = ""
    @objc dynamic var year = 0
    
    @objc dynamic var shop: RepairShop?
    
    convenience init(brand: String, year: Int) {
        self.init()
        self.brand = brand
        self.year = year
    }
}
