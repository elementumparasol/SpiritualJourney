import Foundation
import RealmSwift
import PlaygroundSupport

Example.of("Observing an Object")
PlaygroundPage.current.needsIndefiniteExecution = true



let configuration = Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
let realm = try! Realm(configuration: configuration)
