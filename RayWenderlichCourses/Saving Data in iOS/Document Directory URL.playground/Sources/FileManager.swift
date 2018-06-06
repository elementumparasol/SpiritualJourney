import Foundation

public extension FileManager {
    static var documentDirectorURL: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
