import UIKit

let spaceSceneURL = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: "Scenes")![1]
spaceSceneURL.lastPathComponent


try FileManager.copyPNGSubdirectoriesToDocumentsDirectory(subdirectoryNames: "Scenes", "Stickers")
FileManager.documentDirectoryURL


FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Stickers", imageName: "frog")
FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Scenes", imageName: "Space")
