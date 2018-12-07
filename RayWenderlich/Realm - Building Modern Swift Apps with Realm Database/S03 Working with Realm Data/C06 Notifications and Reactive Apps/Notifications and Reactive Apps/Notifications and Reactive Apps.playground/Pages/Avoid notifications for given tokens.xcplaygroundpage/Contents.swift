import RealmSwift
import PlaygroundSupport

Example.of("Avoid notifications for given tokens")
PlaygroundPage.current.needsIndefiniteExecution = true


let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
let realm = try! Realm(configuration: configuration)

try! TestDataSet.create(in: realm)
