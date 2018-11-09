import UIKit

let json = """
{
    "planes":[
        {
            "manufacturer": "Cessna",
            "model": "172 Skyhawk",
            "seats": 4
        },
        {
            "manufacturer": "Piper",
            "model": "PA-28 Cherokee",
            "seats": 4
        }
    ]
}
""".data(using: .utf8)!


// 创建解码器
let decoder = JSONDecoder()

// 对JSON数据进行解码
let planes = try! decoder.decode([String: [Plane]].self, from: json)

print(planes["planes"]![0].manufacturer)



let fleet = try! decoder.decode(Fleet.self, from: json)
let planes2 = fleet.planes
print(planes2[1].manufacturer)
