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
        
        /// cell加载标识
        static let loadingCell = "LoadingCell"
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
    
    /// 标记是否正在下载数据
    var isLoading = false
    

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
        
        // 加载LoadingCell.xib文件
        cellNib = UINib(nibName: TableViewCellIdentifiers.loadingCell, bundle: nil)
        
        // 注册LoadingCell
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.loadingCell)
        
        // 设置cell的行高
        tableView.rowHeight = 80
    }

    
    // MARK: - 自定义方法

    /// 返回一个URL
    func iTunesURL(searchText: String) -> URL {
        
        // 将不允许出现在URL中的特殊字符进行转义(让它们合法化)
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 拼接URL字符串
        let urlString = String(format: "https://itunes.apple.com/search?term=%@&limit=200", encodedText)
        
        // 将String类型的URL字符串转换为URL对象
        let url = URL(string: urlString)
        
        return url!
    }
    
    /// 发送网络请求(接收从服务器返回的JSON格式的数据)
    func performStoreRequest(with url: URL) -> Data? {
        
        do {
            // return try String(contentsOf: url, encoding: .utf8)
            return try Data(contentsOf: url)
        } catch {
            //print("Download Error: \(error.localizedDescription)")
            
            showNetworkError()
            return nil
        }
    }
    
    /// 解析JSON数据
    func parse(data: Data) -> [SearchResult] {
        
        do {
            let decode = JSONDecoder()
            let result = try decode.decode(ResultArray.self, from: data)
            return result.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
    
    /// 处理网络错误
    func showNetworkError() {
        
        let alert = UIAlertController(title: "Whoops...", message: "There was an error accessing the iTunes Store." + "Please try again.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}


// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    // 返回每一组中cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isLoading {
            return 1
        } else if !hasSearched {
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
        
        if isLoading {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.loadingCell, for: indexPath)
            
            let spinner = cell.viewWithTag(100) as! UIActivityIndicatorView
            
            spinner.startAnimating()
            
            return cell
        }
        
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
            
            if searchResult.artistName.isEmpty {
                cell.artistNameLabel.text = "Unknown"
            } else {
                cell.artistNameLabel.text = String(format: "%@ (%@)", searchResult.artistName, searchResult.type)
            }
            
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
        if searchResults.count == 0 || isLoading {
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
        
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            
            isLoading = true
            tableView.reloadData()
            
            hasSearched = true
            searchResults = []
            
            // 拼接URL全路径。这句代码会访问SearchBar，而这个是
            // 属于UI界面的代码，最好是将其移到主线程里面执行
            let url = iTunesURL(searchText: searchBar.text!)
            
            // 获取一个globalQueue
            let queue = DispatchQueue.global()
            
            // 在后台采用异步的形式执行代码
            queue.async {
                
                // 调用performStoreRequest(with:)方法，
                // 接收从服务器返回的JSON格式的数据
                if let data = self.performStoreRequest(with: url) {
                    
                    // 将解析完的数据存储到数组searchResults中
                    self.searchResults = self.parse(data: data)
                    
                    // 对数组searchResults里面的数据进行排序
                    // 对小于号运算符进行重载之后才能这样用
                    self.searchResults.sort(by: <)
                    
                    // 回到主线程中刷新UI界面
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.tableView.reloadData()
                    }
                    
                    return
                }
            }
            
            
        }
    }
    
    // 消除searchBar和顶部statusBar之间的空白
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
