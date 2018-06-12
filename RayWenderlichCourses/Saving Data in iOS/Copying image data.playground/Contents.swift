import Foundation
import UIKit

let spaceSceneURL = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: "Scenes")![1]
spaceSceneURL.lastPathComponent


try FileManager.copyPNGSubdirectoriesToDocumentsDirectory(subdirectoryNames: "Scenes", "Stickers")
FileManager.documentDirectoryURL


extension FileManager {
    static func getPNGFromDocumentDirectory(subdirectoryName: String, imageName: String) -> UIImage? {
        return UIImage(contentsOfFile: "path")
    }
}
