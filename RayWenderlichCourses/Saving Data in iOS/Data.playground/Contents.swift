import Foundation


let mysteryBytes: [UInt8] = [
    240,          159,          152,          184,
    240,          159,          152,          185,
    0b1111_0000,  0b1001_1111,  0b1001_1000,  186,
    0xF0,         0x9F,         0x98,         187
]

// 创建URL路径
let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)

// 创建数据
let mysteryData = Data(bytes: mysteryBytes)

// 写入数据
try mysteryData.write(to: mysteryDataURL)

// 从URL路径中加载数据
let saveMysteryData = try Data(contentsOf: mysteryDataURL)

// 将Data类型的数据还原成[UInt8]数据
let saveMysteryBytes = Array(saveMysteryData)

// 判断这些数据前后是否相等
saveMysteryBytes == mysteryBytes
saveMysteryData == mysteryData
