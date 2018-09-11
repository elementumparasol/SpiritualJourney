//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - 常量
    
    /// cell的可重用标识符
    struct TableViewCellIdentifiers {
        
        /// 搜索有结果的可重用标识符
        static let searchResultCell = "SearchResultCell"
        
        /// 搜索无结果的可重用标识符
        static let nothingFoundCell = "NothingFoundCell"
    }
    
    
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
        
        // 加载SearchResultCell.xib
        var cellNib = UINib(nibName: TableViewCellIdentifiers.searchResultCell, bundle: nil)
        
        // 注册SearchResultCell
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.searchResultCell)
        
        // 加载NothingFoundCell.xib
        cellNib = UINib(nibName: TableViewCellIdentifiers.nothingFoundCell, bundle: nil)
        
        // 注册NothingFoundCell
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.nothingFoundCell)
        
        // 设置cell的行高
        tableView.rowHeight = 80
    }

    
    // MARK: - 自定义方法

    /// 返回一个URL
    func iTunesURL(searchText: String) -> URL {
        
        // 将不允许出现在URL中的特殊字符进行转义(让它们合法化)
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 拼接URL字符串
        let urlString = String(format: "https://itunes.apple.com/search?term=%@", encodedText)
        
        // 将String类型的URL字符串转换为URL对象
        let url = URL(string: urlString)
        
        return url!
    }
    
    /// 发送网络请求(接收从服务器返回的JSON格式的数据)
    func performStoreRequest(with url: URL) -> String? {
        
        do {
            return try String(contentsOf: url, encoding: .utf8)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    
    
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
        // let cellIdentifier = "SearchResultCell"
        
        // 通过cell标识符去缓存池中取出cell
        // var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        // 如果缓存池中没有这样的cell，则创建带标识符的cell
        /*
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }*/
        
        
        
        
        if searchResults.count == 0 {
            
            // 如果搜索无结果
            return tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.nothingFoundCell, for: indexPath)
            
        } else {
            
            // 根据指定的标识符去缓存池中取出cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.searchResultCell, for: indexPath) as! SearchResultCell
            
            // 取出模型数据
            let searchResult = searchResults[indexPath.row]
            
            // 给cell设置数据
            cell.nameLabel!.text = searchResult.name
            cell.artistNameLabel!.text = searchResult.artistName
            
            return cell
        }
        
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
        
        /*
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
        tableView.reloadData()*/
        
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            
            hasSearched = true
            searchResults = []
            
            let url = iTunesURL(searchText: searchBar.text!)
            print("URL: \(url)")
            
            // 调用performStoreRequest(with:)方法，
            // 接收从服务器返回的JSON格式的数据
            if let jsonString = performStoreRequest(with: url) {
                print("Received JSON string: \(jsonString)")
            }
            
            tableView.reloadData()
        }
    }
    
    // 消除searchBar和顶部statusBar之间的空白
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
