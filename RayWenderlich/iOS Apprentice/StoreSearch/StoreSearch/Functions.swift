//
//  Functions.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

/// 对小于号(<)运算符进行重载
func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}
