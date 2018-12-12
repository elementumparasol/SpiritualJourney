//
//  UITableView+Extension.swift
//  Chatter
//
//  Created by Enrica on 2018/12/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

extension UITableView {
    
    func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
        
        beginUpdates()
        
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        
        reloadRows(at: updates.map(IndexPath.fromRow), with: .none)
        
        endUpdates()
    }
}
