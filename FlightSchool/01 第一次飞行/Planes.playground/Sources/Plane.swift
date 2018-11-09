import Foundation

public struct Plane: Codable {
    
    public var manufacturer: String
    public var model: String
    public var seats: Int
}

public struct Fleet: Decodable {
    
    public var planes: [Plane]
}
