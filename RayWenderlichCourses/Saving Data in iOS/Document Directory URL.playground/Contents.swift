import Foundation

/*
try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

FileManager.documentDirectorURL
*/


//FileManager.documentDirectoryURL.path
FileManager.documentDirectoryURL

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)
mysteryDataURL

let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathExtension("txt")
stringURL
