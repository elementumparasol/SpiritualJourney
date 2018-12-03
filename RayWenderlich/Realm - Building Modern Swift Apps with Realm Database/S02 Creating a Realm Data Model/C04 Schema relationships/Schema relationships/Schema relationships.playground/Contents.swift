import Foundation
import RealmSwift

let realm = try! Realm(
    configuration: Realm.Configuration(inMemoryIdentifier: "TemporaryRealm"))

print("Ready to play!")
