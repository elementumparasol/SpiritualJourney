import UIKit

let json = """
{
    "points": ["KSQL", "KWVI"],
    "KSQL": {
        "code": "KSQL",
        "name": "San Carlos Airport"
    },
    "KWVI": {
        "code": "KWVI",
        "name": "Watsonville Municipal Airport"
    }
}
""".data(using: .utf8)!


// 创建解码器
let decoder = JSONDecoder()

// 对JSON进行解码
let route = try decoder.decode(Route.self, from: json)

print(route.points.map { $0.name })
