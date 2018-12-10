//
//  ChatViewController.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ChatViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


// MARK: - UITableViewDataSource
extension ChatViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row) -- 测试数据"
        cell.detailTextLabel?.text = "QWERT"
        
        return cell
    }
}
