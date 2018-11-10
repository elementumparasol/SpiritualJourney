import UIKit

// 这个JSON数据就比较奇怪，它的类型可能是
// Bird类型，也可能是Plane类型，也可能都是
let json = """
[
    {
        "type": "bird",
        "genus": "Chaetura",
        "species": "Vauxi"
    },
    {
        "type": "plane",
        "identifier": "NA12345"
    }
]
""".data(using: .utf8)!

let decoder = JSONDecoder()

let objects = try! decoder.decode([Either<Bird, Plane>].self, from: json)

for object in objects {
    
    switch object {
        
    case .left(let bird):
        print("bird.genus: \(bird.genus), bird.species: \(bird.species)")
        
    case .right(let plane):
        print("plane.identifier: \(plane.identifier)")
    }
    
}
