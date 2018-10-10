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

/// 标题数据
let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 标题label
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 添加按钮
    @IBOutlet weak var addButton: UIButton!
    
    /// tableView
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - 自定义属性
    
    /// itemTitles中部分标题所对应的下标值
    var items = [5, 6, 7]
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tableView的行高
        self.tableView.rowHeight = 54
    }


    // MARK: - @IBAction
    
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    // 返回tableView中每一组cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // 返回tableView中的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 根据可重用标识符取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
        
        // 设置cell上面的数据
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    // 点击某一行cell的时候调用
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 取消被选中的cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
