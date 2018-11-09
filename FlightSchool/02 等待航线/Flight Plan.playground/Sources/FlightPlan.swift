import Foundation

/// 用来处理航班计划的类型(里面嵌套了一个飞机类型)
public struct FlightPlan: Decodable {
    
    public var aircraft: Aircraft
    public var flightRules: FlightRules
    public var route: [String]
    
    // 定义一个中间类型departureDates来处理时间戳
    private var departureDates: [String: Date]
    public var proposedDepartureDate: Date? {
        return departureDates["proposed"]
    }
    public var actualDepartureDate: Date? {
        return departureDates["actual"]
    }
    
    public var remarks: String?
    
    // 定义一个CodingKeys来指定明确的映射
    // 为名称不匹配的键指定明确的String原始值
    private enum CodingKeys: String, CodingKey {
        
        case aircraft
        case flightRules = "flight_rules"
        case route
        case departureDates = "departure_time"
        case remarks
    }
}
