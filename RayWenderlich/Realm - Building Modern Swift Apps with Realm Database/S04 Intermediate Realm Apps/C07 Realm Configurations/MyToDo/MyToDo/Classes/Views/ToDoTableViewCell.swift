//
//  ToDoTableViewCell.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// 用于展示清单的label
    @IBOutlet weak var itemLabel: UILabel!
    
    /// 用于标记清单是否完成的按钮
    @IBOutlet weak var itemButton: UIButton!
    
    
    // MARK: - 自定义属性
    
    /// 用于标记切换是否已经完成
    var didToggleCompleted: (()->())?
    
    
    // MARK: - @IBAction
    
    /// 用于切换清单是否已经完成的方法
    @IBAction func toggleCompleted() {
        
        // 对当前cell进行标记
        didToggleCompleted?()
    }
    
    
    // MARK: - 自定义方法
    
    /// 根据item更新当前cell的数据
    ///
    /// - Parameter item: 从Realm数据库中取出的数据
    func updateCell(with item: ToDoItem) {
        
        // 如果当前清单已完成，则添加中划线；否则，保持原样
        itemLabel.attributedText = NSAttributedString(string: item.text, attributes: item.isCompleted ? [.strikethroughStyle: true] : [:])
        
        // 如果当前清单已完成，则显示"☑️"；否则，显示"⏺"
        itemButton.setTitle(item.isCompleted ? "☑️": "⏺", for: .normal)
    }

}
