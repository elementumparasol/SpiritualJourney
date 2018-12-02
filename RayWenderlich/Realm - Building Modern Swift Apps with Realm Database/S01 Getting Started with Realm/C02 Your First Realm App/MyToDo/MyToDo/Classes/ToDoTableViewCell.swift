//
//  ToDoTableViewCell.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/2.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    // MARK: - 自定义属性
    
    private var onToggleCompleted: ((ToDoItem) -> Void)?
    private var item: ToDoItem?
    
    
    // MARK: - @IBOutlet
    
    /// 显示内容的label
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 标记选中或者取消选中的按钮
    @IBOutlet weak var checkmark: UIButton!
    
    
    // MARKK: - @IBAction
    
    /// 切换选中或者取消选中
    @IBAction func toggleCompleted(_ sender: Any) {
        
        guard let item = item else {
            fatalError("Missing Todo Item")
        }
        
        onToggleCompleted?(item)
    }
    
    
    // MARK: - 类自带的方法

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - 自定义方法
    
    func configureWith(_ item: ToDoItem, onToggleCompleted: ((ToDoItem) -> Void)? = nil) {
        
        self.item = item
        self.onToggleCompleted = onToggleCompleted
        
        titleLabel.attributedText = NSAttributedString(string: item.text, attributes: item.isCompleted ? [.strikethroughStyle: true] : [:])
        
        checkmark.setTitle(item.isCompleted ? "☑️": "⏺", for: .normal)
    }

}
