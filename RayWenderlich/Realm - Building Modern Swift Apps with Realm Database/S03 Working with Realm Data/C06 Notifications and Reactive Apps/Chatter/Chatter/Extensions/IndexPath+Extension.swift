//
//  IndexPath+Extension.swift
//  Chatter
//
//  Created by Enrica on 2018/12/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension IndexPath {
    
    static func fromRow(_ row: Int) -> IndexPath {
        
        return IndexPath(row: row, section: 0)
    }
}
