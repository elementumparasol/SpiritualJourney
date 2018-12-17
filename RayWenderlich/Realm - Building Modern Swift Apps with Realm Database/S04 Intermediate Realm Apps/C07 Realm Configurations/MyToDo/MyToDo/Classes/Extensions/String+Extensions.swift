//
//  String+Extensions.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/17.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

extension String {
    
    var sha512: Data? {
        let stringData = data(using: String.Encoding.utf8)!
        var result = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
        _ = result.withUnsafeMutableBytes { resultBytes in
            stringData.withUnsafeBytes { stringBytes in
                CC_SHA512(stringBytes, CC_LONG(stringData.count), resultBytes)
            }
        }
        
        return result
    }
}
