//
//  IndexPath+Extension.swift
//  Chatter
//
//  Created by Enrica on 2018/12/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension IndexPath {
    
    /// 根据指定的索引获取相应的indexPath
    ///
    /// - Parameter row: 指定的索引
    /// - Returns: 返回指定的indexPath
    static func fromRow(_ row: Int) -> IndexPath {
        
        return IndexPath(row: row, section: 0)
    }
}
