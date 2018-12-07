import RealmSwift
import PlaygroundSupport

Example.of("Collection Changes")
PlaygroundPage.current.needsIndefiniteExecution = true


let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
let realm = try! Realm(configuration: configuration)

try! TestDataSet.create(in: realm)
