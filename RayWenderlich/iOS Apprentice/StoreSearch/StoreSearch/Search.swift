//
//  Search.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

/// 自定义一个只带一个Bool参数，并且没有返回
/// 值的新类型，然后将其命名为SearchComplete
typealias SearchComplete = (Bool) -> Void

class Search {
    
    // MARK: - 枚举常量
    
    /// 搜索分类。注意，因为Category是定义在
    /// Search这个类里面的，所以在外部使用时
    /// 应该使用全名Search.Category，换句话
    /// 说，Category是在命名空间Search内部
    enum Category: Int {
        
        /// 全部
        case all = 0
        
        /// 音乐
        case music = 1
        
        /// 软件
        case software = 2
        
        /// 电子书
        case ebooks = 3
        
        /// 在Swift中，枚举具有部分面向对象的特性，
        /// 它允许我们在里面定义属性和方法。所以，
        /// 我们可以在里面定义一个type计算属性，将
        /// 每个成员所代表的字符串含义返回出去
        var type: String {
            
            switch self {
            case .all:
                return ""
            case .music:
                return "musicTrack"
            case .software:
                return "software"
            case .ebooks:
                return "ebook"
            }
        }
    }
    
    // MARK: - 自定义属性
    
    /// 存储搜索结果
    var searchResults: [SearchResult] = []
    
    /// 记录用户是否发起搜索请求
    var hasSearched = false
    
    /// 标记是否正在下载数据
    var isLoading = false
    
    /// 用于存储dataTask
    private var dataTask: URLSessionDataTask? = nil
    
    
    // MARK: - 自定义方法
    
    
    /// 执行网络搜索
    ///
    /// - Parameters:
    ///   - text: 搜索的内容
    ///   - category: 搜索的类别
    ///   - completionSearch: 一个闭包，搜索完成之后，通知外界到底是搜索成功还是失败
    func performSearch(for text: String, category: Category, completionSearch: @escaping SearchComplete) {
        
        if !text.isEmpty {
            
            // 取消前一次的dataTask
            dataTask?.cancel()
            
            isLoading = true
            hasSearched = true
            searchResults = []
            
            // 拼接URL全路径。这句代码会访问SearchBar，而这个是
            // 属于UI界面的代码，最好是将其移到主线程里面执行
            let url = iTunesURL(searchText: text, category: category)
            
            // 获取URLSession实例。这个实例会使用一些默认的配置
            let session = URLSession.shared
            
            // 创建dataTask。dataTask的作用是，根据指定的URL
            // 从服务器获取相应的数据。当dataTask收到服务器的响
            // 应时，就会调用闭包，并且执行它里面的代码
            dataTask = session.dataTask(with: url) { (data, response, error) in
                
                var success = false
                
                if let error = error as NSError?, error.code == -999 {
                    
                    /**
                     处理搜索取消
                     */
                    
                    // 直接返回
                    return
                    
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
                    
                    /**
                     处理搜索成功
                     */
                    
                    // 解析JSON数据
                    self.searchResults = self.parse(data: data)
                    
                    // 对数据按A~Z进行排序
                    self.searchResults.sort(by: <)
                    
                    print("Sucess!")
                    
                    self.isLoading = false
                    
                    // 如果网络请求成功，则表示success为true
                    success = true
                }
                
                /**
                 处理搜索失败
                 */
                
                if !success {
                    print("Failure: \(response!)")
                    self.hasSearched = false
                    self.isLoading = false
                }
                
                // 搜索完成以后，调用闭包通知外界
                DispatchQueue.main.async {
                    
                    // 调用completionSearch，
                    // 并且将参数success传进去
                    completionSearch(success)
                }
                
            }
            
            // 创建完dataTask之后，需要调用resume()方法来使用它
            // 这个步骤会以后台执行的方式向服务器发送网络请求。也就
            // 是说，真正发起网络请求的是在调用resume()方法之后
            dataTask?.resume()  // 这一步完成之后才会执行dataTask的闭包
        }
    }
    
    /// 返回一个完整的URL地址
    ///
    /// - Parameters:
    ///   - searchText: 搜索的内容
    ///   - category: 搜索分类，枚举进行表示
    /// - Returns: 返回一个完整的用于网络请求的URL地址
    private func iTunesURL(searchText: String, category: Category) -> URL {
        
        // 用于保存搜索类型
        let kind = category.type
        
        // 将不允许出现在URL中的特殊字符进行转义(让它们合法化)
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 拼接URL字符串
        let urlString = "https://itunes.apple.com/search?" + "term=\(encodedText)&limit=200&entity=\(kind)"
        
        // 将String类型的URL字符串转换为URL对象
        let url = URL(string: urlString)
        
        return url!
    }
    
    /// 解析JSON数据
    ///
    /// - Parameter data: 从服务器返回的二进制数据
    /// - Returns: 将解析之后的数据以模型数组的形式进行返回
    private func parse(data: Data) -> [SearchResult] {
        
        do {
            let decode = JSONDecoder()
            let result = try decode.decode(ResultArray.self, from: data)
            return result.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
    
    
}
