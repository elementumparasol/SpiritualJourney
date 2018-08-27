//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit


// MARK: - 声明ListDetailViewControllerDelegate协议
protocol ListDetailViewControllerDelegate: class {
    
    /// 取消添加Item
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    
    /// 添加完Item
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    
    /// 完成对Item的编辑
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}


// MARK: - ListDetailViewController主体部分
class ListDetailViewController: UITableViewController {
    
    // MARK: - 控件属性
    
    /// 文本框控件属性
    @IBOutlet weak var textField: UITextField!
    
    
    /// 完成添加的按钮属性
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    // MARK: - 自定义属性
    
    /// 代理属性
    weak var delegate: ListDetailViewControllerDelegate?
    
    /// 编辑list
    var checklistToEdit: Checklist?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 让textField成为第一响应者
        textField.becomeFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 取消大标题模式
        navigationItem.largeTitleDisplayMode = .never
        
        if let checklist = checklistToEdit {
            
            // 修改标题
            title = "编辑checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
        
        // 让当前控制器成为textField的代理(可以从storyboard中设置)
        // textField.delegate = self
    }

    /// 点击取消按钮
    @IBAction func cancel() {
        
        // 通知代理，取消item的添加或者编辑
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    /// 点击完成按钮
    @IBAction func done() {
        
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            
            // 通知代理，完成item的编辑
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
        } else {
            
            let checklist = Checklist(name: textField.text!)
            
            // 通知代理，完成item的添加
            delegate?.listDetailViewController(self, didFinishAdding: checklist)
        }
    }
    
    
    
}


// MARK: - UITableViewDelegate
extension ListDetailViewController {
    
    /// 这个方法一般用来通知代理，返回的那一行被选中，如果返回nil，则表示不选中
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}



// MARK: - UITextFieldDelegate
extension ListDetailViewController: UITextFieldDelegate {
    
    /// 监听文本框中的内容，如果为空，就让doneBarButtonItem禁用；否则，就启用
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
}
