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
    
    /// segmentControl
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    // MARK: - @IBAction
    
    /// segmentedControl
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        // 点击segmentedControl执行搜索
        performSearch()
    }
    
    
    
    // MARK: - 自定义属性
    
    /// 搜索结果
    var searchResults = [SearchResult]()
    
    /// 记录用户是否发起搜索请求
    var hasSearched = false
    
    /// 标记是否正在下载数据
    var isLoading = false
    
    /// 用于存储dataTask
    var dataTask: URLSessionDataTask?
    
    /// 横屏控制器
    var landscapeVC: LandscapeViewController?
    

    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 调整tableView的边距。searchBar和NavigationBar
        // 遮挡住了tableView第0行cell
        tableView.contentInset = UIEdgeInsets(top: 108, left: 0, bottom: 0, right: 0)
        
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
    
    
    // 当执行segue是调用这个方法(在这里将数据传递过去)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            
            // 取出相应的控制器
            let controller = segue.destination as! DetailViewController
            
            // 取出对应的indexPath
            let indexPath = sender as! IndexPath
            
            // 获取对应的searchResult数据
            let searchResult = searchResults[indexPath.row]
            
            // 将searchResult数据传递给DetailViewController的searchResult
            controller.searchResult = searchResult
        }
    }
    
    // 这个方法并不会在设置旋转时调用，而是当控制器的特征集合
    // 发生改变时，就会自动调用。控制器的特征集合主要有:
    // - 水平方向size classes的改变
    // - 垂直方向size classes的改变
    // - 显示比例(比如说，是否为Retina屏幕)
    // - 用户界面(比如说，是iPhone还是iPad)
    // - 首选的动态类型字体大小
    // - 以及一些其它事项
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        switch newCollection.verticalSizeClass {
        case .compact:
            showLandscape(with: coordinator)
        case .regular, .unspecified:
            hideLandscape(with: coordinator)
        }
    }

    
    // MARK: - 自定义方法

    /// 返回一个URL
    func iTunesURL(searchText: String, category: Int) -> URL {
        
        // 用于保存搜索类型
        let kind: String
        
        switch category {
        case 1:
            kind = "musicTrack"
        case 2:
            kind = "software"
        case 3:
            kind = "ebook"
        default:
            kind = ""
        }
        
        // 将不允许出现在URL中的特殊字符进行转义(让它们合法化)
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 拼接URL字符串
        //let urlString = String(format: "https://itunes.apple.com/search?term=%@&limit=200", encodedText)
        let urlString = "https://itunes.apple.com/search?" + "term=\(encodedText)&limit=200&entity=\(kind)"
        
        // 将String类型的URL字符串转换为URL对象
        let url = URL(string: urlString)
        
        return url!
    }
    
    /*
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
    }*/
    
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
    
    /// 显示横屏控制器。它其实是改在tableView、navigationBar和
    /// segmentedController上面
    func showLandscape(with coordinator: UIViewControllerTransitionCoordinator) {
        
        // 隐藏当前界面上所有modal出来的控制器
        if self.presentedViewController != nil {
            self.dismiss(animated: true, completion: nil)
        }
        
        // 对landscapeVC进行校验
        guard landscapeVC == nil else { return }
        
        // 通过storyboard标识符加载LandscapeViewController
        // 控制器，并且将其保存到landscapeVC中
        landscapeVC = storyboard!.instantiateViewController(withIdentifier: "LandscapeViewController") as? LandscapeViewController
        
        // 再次对landscapeVC进行校验，看是否从storyboard中加载成功
        if let controller = landscapeVC {
            
            // 将数据传递给LandscapeViewController的searchResults
            controller.searchResults = searchResults
            
            // 设置controller的view的frame
            controller.view.frame = view.bounds
            
            // 设置透明度动画
            controller.view.alpha = 0
            
            // 将controller的view添加到当前控制器的view上
            view.addSubview(controller.view)
            
            // 将controller作为当前控制器的子控制器
            addChild(controller)
            
            // 执行透明度动画
            coordinator.animate(alongsideTransition: { (_) in
                
                // 重新恢复alpha值
                controller.view.alpha = 1
                
                // 隐藏键盘
                self.searchBar.resignFirstResponder()
            }) { (_) in
                
                // 通过didMove(toParent: )方法告诉controller
                // 它现在有一个父控制器。也就是说，现在SearchViewController
                // 是父控制器，而LandscapeViewController是它的子控制器
                // 这个方法是在把控制器添加到父控制器之后调用，或者把控制器
                // 从父控制器上面移除之后调用
                controller.didMove(toParent: self)
            }
        }
    }
    
    /// 隐藏横屏控制器
    func hideLandscape(with coordinator: UIViewControllerTransitionCoordinator) {
        
        // 对landscapeVC的值进行校验
        if let controller = landscapeVC {
            
            // 把控制器添加到其父控制器之前调用
            // 或者把控制器从其父控制器上面移除之前调用
            controller.willMove(toParent: nil)
            
            // 添加动画
            coordinator.animate(alongsideTransition: { (_) in
                
                controller.view.alpha = 0
            }) { (_) in
                
                // 将controller的view从它的父控件上移除
                controller.view.removeFromSuperview()
                
                // 将controller从它的父控制器上移除
                controller.removeFromParent()
                
                // 清空landscapeVC的值。移除对LandscapeViewController
                // 的强引用，如若不清空，则LandscapeViewController无法释放
                self.landscapeVC = nil
            }
        }
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
            cell.configure(for: searchResult)
            
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
        
        // 执行Segue，跳转到指定的控制器
        performSegue(withIdentifier: "ShowDetail", sender: indexPath)
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
        
        // 点击搜索框的搜索按钮时，发起网络请求
        performSearch()
    }
    
    // 消除searchBar和顶部statusBar之间的空白
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}



// MARK: - 网络
extension SearchViewController {
    
    /// 向服务器发起网络请求，执行搜索
    func performSearch() {
        
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            
            // 取消前一次的dataTask
            dataTask?.cancel()
            
            isLoading = true
            tableView.reloadData()
            
            hasSearched = true
            searchResults = []
            
            // 拼接URL全路径。这句代码会访问SearchBar，而这个是
            // 属于UI界面的代码，最好是将其移到主线程里面执行
            let url = iTunesURL(searchText: searchBar.text!, category: segmentedControl.selectedSegmentIndex)
            
            // 获取URLSession实例。这个实例会使用一些默认的配置
            let session = URLSession.shared
            
            // 创建dataTask。dataTask的作用是，根据指定的URL
            // 从服务器获取相应的数据。当dataTask收到服务器的响
            // 应时，就会调用闭包，并且执行它里面的代码
            dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if let error = error as NSError?, error.code == -999 {
                    
                    /**
                     处理搜索取消
                     */
                    
                    // 直接返回
                    return
                    
                } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    
                    /**
                     处理搜索成功
                     */
                    
                    if let data = data {
                        
                        // 解析JSON数据
                        self.searchResults = self.parse(data: data)
                        
                        // 对数据按A~Z进行排序
                        self.searchResults.sort(by: <)
                        
                        // 回到主线程中刷新UI。因为URLSession默认是在后台异
                        // 步执行网络请求的，因此要记得回到主线程中刷新UI界面
                        DispatchQueue.main.async {
                            self.isLoading = false
                            self.tableView.reloadData()
                        }
                        
                        // 如果网络请求成功，则直接退出，不再执行后面失败的代码
                        return
                        
                    }
                } else {
                    
                    /**
                     处理搜索失败
                     */
                    
                    print("Failure: \(response!)")
                }
                
                // 如果网路请求失败，则执行下面的代码
                DispatchQueue.main.async {
                    self.hasSearched = false
                    self.isLoading = false
                    self.tableView.reloadData()
                    self.showNetworkError()
                }
            }
            
            // 创建完dataTask之后，需要调用resume()方法来使用它
            // 这个步骤会以后台执行的方式向服务器发送网络请求。也就
            // 是说，真正发起网络请求的是在调用resume()方法之后
            dataTask?.resume()  // 这一步完成之后才会执行dataTask的闭包
            
            
            
        }
    }
}
