import RealmSwift
import PlaygroundSupport

Example.of("Realm wide notifications")
PlaygroundPage.current.needsIndefiniteExecution = true



let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
let realm = try! Realm(configuration: configuration)
