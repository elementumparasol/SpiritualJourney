//
//  itemDetailViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    
    /// 取消添加Item
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    
    /// 添加完Item
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    
    /// 完成对Item的编辑
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}



class ItemDetailViewController: UITableViewController {

    // MARK: - 控件属性
    
    /// textField
    @IBOutlet weak var textField: UITextField!
    
    /// 完成按钮
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    /// Switch开关
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    
    /// 计划日期
    @IBOutlet weak var dueDateLabel: UILabel!
    
    /// 插入datePicker控件的cell
    @IBOutlet weak var datePickerCell: UITableViewCell!
    
    /// datePicker控件
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    // MARK: - itemDetailViewControllerDelegate属性
    
    /// 代理属性，用于通知
    weak var delegate: ItemDetailViewControllerDelegate?
    
    
    // MARK: - 实例变量
    
    /// 编辑item
    var itemToEdit: ChecklistItem?
    
    /// 日期变量
    var dueDate = Date()
    
    ///
    var datePickerVisible = false
    
    
    
    /// 视图控件即将显示的时候调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 让textField成为第一响应者，当textField
        // 控件显示出来时，键盘也跟随者主动弹出来
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 取消大标题
        navigationItem.largeTitleDisplayMode = .never
        
        // 修改导航栏标题
        if let item = itemToEdit {
            title = "编辑item"
            textField.text = item.text
            doneBarButton.isEnabled = true
            
            shouldRemindSwitch.isOn = item.shouldRemind
            dueDate = item.dueDate
        }
        
        updateDueDateLabel()
    }
    
    /// 取消编辑
    @IBAction func cancel() {
        
        // 通知代理
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    /// 完成编辑
    @IBAction func done() {
        
        if let item = itemToEdit {
            item.text = textField.text!
            
            item.shouldRemind = shouldRemindSwitch.isOn
            item.dueDate = dueDate
            
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            
            item.shouldRemind = shouldRemindSwitch.isOn
            item.dueDate = dueDate
    
            // 通知代理
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    
    @IBAction func dateChanged(_ datePicker: UIDatePicker) {
        
        dueDate = datePicker.date
        updateDueDateLabel()
    }
    
    
    
    /// 设置显示时间label上面的Text
    func updateDueDateLabel() {
        
        // 将Date实例变量的值转换为文字，需要用到DateFormatter实例
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        dueDateLabel.text = formatter.string(from: dueDate)
    }
    
    /// 显示datePicker
    func showDatePicker() {
        
        datePickerVisible = true
        let indexPathDatePicker = IndexPath(row: 2, section: 1)
        tableView.insertRows(at: [indexPathDatePicker], with: .fade)
        datePicker.setDate(dueDate, animated: false)
    }
    
    /// 隐藏datePicker
    func hideDatePicker() {
        
        if datePickerVisible {
            datePickerVisible = false
            
            let indexPathDatePicker = IndexPath(row: 2, section: 1)
            tableView.deleteRows(at: [indexPathDatePicker], with: .fade)
        }
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 && datePickerVisible {
            return 3
        } else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
    }
    
    // 因为ItemDetailViewController描述的是静态的tableView，所以是不需要
    // 实现数据源方法的。但是，有时候会有一些特殊需求，需要用到数据源中的方法
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 对Section1和row3这一行cell进行特殊处理，其它的按照系统默认处理
        if indexPath.section == 1 && indexPath.row == 2 {
            return datePickerCell
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    
    
    
    
    // MARK: - UITableViewDelegation
    
    /// 取消选中时变灰的效果(告诉tableView，当用户点击那一行时，不要选中)
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if indexPath.section == 1 && indexPath.row == 1 {
            return indexPath
        } else {
            return nil
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 && indexPath.row == 2 {
            return 217
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        textField.resignFirstResponder()
        
        if indexPath.section == 1 && indexPath.row == 1 {
            if !datePickerVisible {
                showDatePicker()
            } else {
                hideDatePicker()
            }
        }
    }

    // 如果在静态cell的tableView中实现了数据源方法，就必须实现这个
    // 代理方法，否则，会引发程序崩溃
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        
        var newIndexPath = indexPath
        if indexPath.section == 1 && indexPath.row == 2 {
            newIndexPath = IndexPath(row: 0, section: indexPath.section)
        }
        
        return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
    }
    
}



extension ItemDetailViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    // 当开始在textFiled里面编辑时，需要隐藏datePicker
    func textFieldDidBeginEditing(_ textField: UITextField) {
        hideDatePicker()
    }
    
}
