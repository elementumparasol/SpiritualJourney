//
//  Functions.swift
//  GitFeed
//
//  Created by Enrica on 2018/10/20.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

public func cachedFileURL(_ fileName: String) -> URL {
    return FileManager.default
        .urls(for: .cachesDirectory, in: .allDomainsMask)
        .first!
        .appendingPathComponent(fileName)
}
