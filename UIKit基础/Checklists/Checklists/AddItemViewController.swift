//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    
    /// 取消添加Item
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    
    /// 添加完Item
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}



class AddItemViewController: UITableViewController {

    // MARK: - 控件属性
    
    /// textField
    @IBOutlet weak var textField: UITextField!
    
    /// 完成按钮
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    // MARK: - AddItemViewControllerDelegate属性
    
    /// 代理属性，用于通知
    weak var delegate: AddItemViewControllerDelegate?
    
    
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
    }
    
    /// 取消编辑
    @IBAction func cancel() {
        //navigationController?.popViewController(animated: true)
        
        // 通知代理
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    /// 完成编辑
    @IBAction func done() {
        
        //print("textField文本框中的内容为: \(textField.text!)")
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        
        // 通知代理
        delegate?.addItemViewController(self, didFinishAdding: item)
        
        //navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UITableViewDelegation
    
    
    /// 取消选中时变灰的效果(告诉tableView，当用户点击那一行时，不要选中)
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    

}



extension AddItemViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
//        if newText.isEmpty {
//            doneBarButton.isEnabled = false
//        } else {
//            doneBarButton.isEnabled = true
//        }
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
}
