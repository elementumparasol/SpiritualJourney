//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// tableView
    @IBOutlet weak var tableView: UITableView!
    
    /// searchBar
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // MARK: - 自定义属性
    
    /// 搜索结果
    var searchResults = [SearchResult]()
    
    /// 记录用户是否发起搜索请求
    var hasSearched = false
    

    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 调整tableView的边距(searchBar遮挡住了tableView第0行cell)
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }

    
    // MARK: - 自定义方法

}


// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    // 返回每一组中cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    // 返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 创建cell标识符
        let cellIdentifier = "SearchResultCell"
        
        // 通过cell标识符去缓存池中取出cell
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        // 如果缓存池中没有这样的cell，则创建带标识符的cell
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        if searchResults.count == 0 {
            cell.textLabel!.text = "(Nothing Found)"
            cell.detailTextLabel!.text = ""
        } else {
            // 取出模型数据
            let searchResult = searchResults[indexPath.row]
            
            // 给cell设置数据
            cell.textLabel!.text = searchResult.name
            cell.detailTextLabel!.text = searchResult.artistName
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    // 点击某一行cell的时候调用
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 取消cell被选中
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 返回被选中cell的indexPath
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        // 只有拥有搜索结果之后才能选中某一行cell
        if searchResults.count == 0 {
            return nil  // 也就是确保搜索结果出现"Nothing Found"是不会被选中
        } else {
            return indexPath
        }
    }
    
    
    
}


// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    // 点击搜索按钮的时候调用
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // 点击完搜索按钮之后，让键盘退出去
        searchBar.resignFirstResponder()
        
        searchResults = []
        
        if searchBar.text! != "Justin Bieber" {
            
            for i in 0...2 {
                
                let searchResult = SearchResult()
                searchResult.name = String(format: "Fake Result %d for", i)
                searchResult.artistName = searchBar.text!
                searchResults.append(searchResult)
            }
        }
        
        // 到这里，说明用户已经发起了搜索请求
        hasSearched = true
        tableView.reloadData()
    }
    
    // 消除searchBar和顶部statusBar之间的空白
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
