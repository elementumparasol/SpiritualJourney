//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    
    /// 返回tableView的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    /// 返回tableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // 调用makeCell(for: )方法，取出或者创建cell
        let cell = makeCell(for: tableView)
        cell.textLabel?.text = "List \(indexPath.row)"
        
        return cell
    }

    /// 根据标识符去缓存池中取出相应的cell；如果没有这样的cell，
    /// 则创建带标识符的cell
    func makeCell(for tableView: UITableView) -> UITableViewCell {
        
        // 创建cell标识符
        let cellIdentifier = "Cell"
        
        // 根据标识符去缓存池中取出cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            
            // 如果没有这样的cell，就创建带标识符的cell
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }
}
