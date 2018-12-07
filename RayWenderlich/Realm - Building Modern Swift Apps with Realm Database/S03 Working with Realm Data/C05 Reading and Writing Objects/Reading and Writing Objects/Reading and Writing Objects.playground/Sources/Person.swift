import Foundation
import RealmSwift
import CoreLocation

@objcMembers public class Person: Object {
    public dynamic var firstName = ""
    public dynamic var lastName: String?
    
    public dynamic var born = Date.distantPast
    public dynamic var deceased: Date?
    
    public dynamic var isVIP = false
    public dynamic var allowedPublicationOn: Date?
    public let aliases = List<String>()
    
    public dynamic var hairCount: Int64 = 0
    
    public var isDeceased: Bool {
        return deceased != nil
    }
    
    public var fullName: String {
        guard let last = lastName else {
            return firstName
        }
        return "\(firstName) \(last)"
    }
    
    public convenience init(firstName: String, born: Date) {
        self.init()
        self.firstName = firstName
        self.born = born
    }
    
    public dynamic var key = UUID().uuidString
    public override static func primaryKey() -> String? {
        return "key"
    }
}

public extension Person {
    
    static let fieldHairCount = "hairCount"
    static let fieldDeceased = "deceased"
    
    static func allAliveLikelyBalding(`in` realm: Realm, hairThreshold: Int = 1000) -> Results<Person> {
        
        let predicate = NSPredicate(format: "%K < %d AND %K = nil", Person.fieldHairCount, hairThreshold, Person.fieldDeceased)
        
        return realm.objects(Person.self).filter(predicate)
    }
}
