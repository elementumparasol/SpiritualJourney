import UIKit

let json = """
{
    "aircraft": {
        "identification": "NA12345",
        "color": "Blue/White"
    },
    "route": ["KTTD", "KHIO"],
    "departure_time": {
        "proposed": "2018-04-20T15:07:24-07:00",
        "actual": "2018-04-20T15:07:24-07:00"
    },
    "flight_rules": "IFR",
    "remarks": null
}
""".data(using: .utf8)!

// 创建解码器
let decoder = JSONDecoder()

// 处理时间戳
decoder.dateDecodingStrategy = .iso8601

// 对json数据进行解码，将JSON数据转成模型
let plan = try! decoder.decode(FlightPlan.self, from: json)

print(plan.aircraft.identification)  // NA12345
print(plan.aircraft.color)  // Blue/White
print(plan.route)
print(plan.actualDepartureDate!)
print(plan.proposedDepartureDate!)
print(plan.flightRules)
//print(plan.remarks!)
