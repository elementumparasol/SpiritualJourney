import Foundation
import RealmSwift

// MARK: - Person Realm Object

public class Person: Object {
    
    // object properties
    @objc public dynamic var firstName = ""
    @objc public dynamic var lastName: String?
    
    public var fullName: String {
        guard let last = lastName else {
            return firstName
        }
        return "\(firstName) \(last)"
    }
    
    // required vs. optional properties, default values, and required to override
    public convenience init(firstName: String) {
        self.init()
        self.firstName = firstName
    }
    
    // primary key (primary vs. auto-increment)
    @objc public dynamic var key = UUID().uuidString
    public override static func primaryKey() -> String? {
        return "key"
    }
    
    public override var description: String {
        return "(Person) \"\(fullName)\""
    }
}
