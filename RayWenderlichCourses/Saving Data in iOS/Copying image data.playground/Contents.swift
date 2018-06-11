import Foundation

let spaceSceneURL = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: "Scenes")![1]
spaceSceneURL.lastPathComponent


try FileManager.copyPNGSubdirectoriesToDocumentsDirectory(subdirectoryNames: "Scenes", "Stickers")
FileManager.documentDirectoryURL
