//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 数据模型
 */

import UIKit

class ResultArray: Codable {
    
    /// 返回item的个数
    var resultCount = 0
    
    /// 服务器返回的数
    var results = [SearchResult]()
}

class SearchResult: Codable, CustomStringConvertible {
    
    /// 艺术家的名字
    var artistName = ""
    
    /// 曲目名称
    var trackName = ""
    
    /// 名称(使用名称来返回曲目名称)
    var name: String {
        return trackName
    }
    
    /// 将实例对象以字符串的形式输出(方便人为查看)
    var description: String {
        return "Name: \(name), Artist Name: \(artistName)"
    }
}
