//
//  ViewController.swift
//  自动布局
//
//  Created by Enrica on 2018/10/8.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

/// cell可重用标识符
private let cellIdentifier = "Cell"

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 标题label
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 添加按钮
    @IBOutlet weak var addButton: UIButton!
    
    /// tableView
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - 自定义属性
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    // MARK: - @IBAction
    
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    // 返回tableView中每一组cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    // 返回tableView中的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "cell --- \(indexPath.row)"
        
        return cell
    }
    
    
}
