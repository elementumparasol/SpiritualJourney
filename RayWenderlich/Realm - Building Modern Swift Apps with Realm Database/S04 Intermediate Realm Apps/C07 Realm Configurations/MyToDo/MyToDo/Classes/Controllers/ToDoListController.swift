//
//  ToDoListController.swift
//  MyToDo
//
//  Created by Enrica on 2018/12/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ToDoListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


// MARK: - UITableViewDataSource
extension ToDoListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "indexPath: \(indexPath.row)"
        
        return cell
    }
}
