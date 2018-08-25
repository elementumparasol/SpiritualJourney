//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    // MARK: - 控件属性
    
    /// textField
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 取消大标题
        navigationItem.largeTitleDisplayMode = .never
    }
    
    /// 取消编辑
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    /// 完成编辑
    @IBAction func done() {
        
        print("textField文本框中的内容为: \(textField.text!)")
        
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UITableViewDelegation
    
    
    /// 取消选中时变灰的效果(告诉tableView，当用户点击那一行时，不要选中)
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    

}
