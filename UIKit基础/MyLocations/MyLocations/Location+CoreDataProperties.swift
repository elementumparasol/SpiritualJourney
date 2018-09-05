//
//  Location+CoreDataProperties.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/5.
//  Copyright © 2018 Enrica. All rights reserved.
//
//

import Foundation
import CoreData
import Core Location


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var date: Date
    @NSManaged public var locationDescription: String
    @NSManaged public var category: String
    @NSManaged public var placemark: CLPlacemark?

}
