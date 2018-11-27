//
//  ViewController.swift
//  Github
//
//  Created by Enrica on 2018/11/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 导航栏标题
    private let titleString = "ReactiveX/RxSwift"
    
    ///

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏标题
        title = titleString
        
        
    }

    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row) --- text"
        
        return cell
    }

}

