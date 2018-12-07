import Foundation
import RealmSwift
import PlaygroundSupport

Example.of("Observing a Collection")
PlaygroundPage.current.needsIndefiniteExecution = true


let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
let realm = try! Realm(configuration: configuration)

try! TestDataSet.create(in: realm)
