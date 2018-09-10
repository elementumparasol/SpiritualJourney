//
//  String+AddText.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/9.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension String {
    
    /// 如果原始字符串不为空，则将指定的字符串text拼接到原始字符串后面
    mutating func add(text: String?, separatedBy separator: String = "") {
        
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
