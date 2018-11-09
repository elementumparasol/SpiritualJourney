import Foundation


/// 这是一个枚举
public enum FlightRules: String, Decodable {
    
    case visual = "VFR"
    case instrument = "IFR"
}
