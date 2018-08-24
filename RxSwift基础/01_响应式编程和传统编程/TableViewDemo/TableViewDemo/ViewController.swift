//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

/// Cell标识符
private let KcellIdentifier = "KcellIdentifier"

class ViewController: UIViewController {
    
    /// tableView属性
    @IBOutlet weak var tableView: UITableView!
    
    /// 模型数组
    private lazy var songModelArr: [SongModel] = [SongModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置数据源代理
        tableView.dataSource = self;
        
        // 注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: KcellIdentifier)
        
        // 加载数据
        loadData()
    }

    /// 加载plist文件中的数据
    func loadData() {
        
        // 加载plist文件
        guard let path = Bundle.main.path(forResource: "songs", ofType: "plist") else { return }
        
        // 从plist文件中取出数据
        guard let dictArray = NSArray(contentsOfFile: path) as? [[String: String]] else { return }
        
        // 遍历数组，取出字典
        for dict in dictArray {
            
            // 将字典转为模型
            let item = SongModel(dict: dict)
            
            // 将模型添加到数组中
            songModelArr.append(item)
        }
    }

}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songModelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 按标识符取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: KcellIdentifier)
        
        // 取出模型
        let songItem = songModelArr[indexPath.row]
        
        // 设置标题
        cell?.textLabel?.text = songItem.song
        
        return cell!
    }
    
    
    
}
