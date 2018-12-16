//
//  LocalizedPath.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

enum PathError: Error, LocalizedError {
    case notFound
    
    var errorDescription: String? {
        switch self {
        case .notFound: return "Resource not found"
        }
    }
}

class LocalizedPath {
    
    
    /// 在Documents文件夹下面自定义Realm数据库文件的名称
    ///
    /// - Parameter fileName: Realm数据库文件的名称
    /// - Returns: 返回Realm数据库文件的路径
    /// - Throws: 如果发生异常，则抛出错误
    static func inDocuments(_ fileName: String) throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(fileName)
    }
    
    /// 将Realm数据库文件存储在Library目录下面，并且自定义文件名称
    ///
    /// - Parameter fileName: Realm数据库文件的名称
    /// - Returns: 返回Realm数据库文件的路径
    /// - Throws: 如果发生异常，则抛出错误
    static func inLibrary(_ fileName: String) throws -> URL {
        return try FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(fileName)
    }
    
    /// 将Realm数据库文件存储到Bundle中，并且自定义文件名称
    ///
    /// - Parameter fileName: Realm数据库文件的名称
    /// - Returns: 返回Realm数据库文件的路径
    /// - Throws: 如果发生异常，则抛出错误
    static func inBundle(_ fileName: String) throws -> URL {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            throw PathError.notFound
        }
        
        return url
    }
    
    
    /// 返回Realm数据库默认的存储路径
    ///
    /// - Returns: 返回Realm数据库文件的路径
    /// - Throws: 如果发生异常，则抛出错误
    static func documents() throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
}
