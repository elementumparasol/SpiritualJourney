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
    
    /// 分类
    var kind: String?
    
    /// 艺术家的名字
    var artistName = ""
    
    /// 曲目名称
    var trackName: String?
    
    /// 曲目售价
    var trackPrice: Double?
    
    /// 曲目插图
    var trackViewUrl: String?
    
    /// 专辑名称
    var collectionName: String?
    
    /// 专辑插图
    var collectionViewUrl: String?
    
    /// 专辑售价
    var collectionPrice: Double?
    
    /// item售价
    var itemPrice: Double?
    
    /// item分类(风格、流派)
    var itemGenre: String?
    
    /// 书籍的分类或者流派
    var bookGenre: [String]?
    
    /// 货币
    var currency = ""
    
    /// 60X60的插图链接
    var imageSmall = ""
    
    /// 100X100的插图链接
    var imageLarge = ""
    
    /// 曲目名称或者专辑名称
    var name: String {
        
        // 如果trackName有值，则解包
        // 否则就对collectionName进行解包
        // 如果collectionName也没有值，则返回空字符串
        return trackName ?? collectionName ?? ""
    }
    
    /// 曲目插图或者专辑插图
    var storeURL: String {
        return trackViewUrl ?? collectionViewUrl ?? ""
    }
    
    /// 曲目价格或者专辑价格
    var price: Double {
        return trackPrice ?? collectionPrice ?? 0.0
    }
    
    /// item或者bookGenre
    var genre: String {
        
        if let genre = itemGenre {
            return genre
        } else if let genres = bookGenre {
            return genres.joined(separator: ", ")
        }
        
        return ""
    }
    
    /// 类型
    var type: String {
        let kind = self.kind ?? "audiiobook"
        
        switch kind {
        case "album":
            return "Album"
        case "audibook":
            return "Audiobook"
        case "book":
            return "Book"
        case "ebook":
            return "E-Book"
        case "feature-moive":
            return "Moive"
        case "music-video":
            return "Music Video"
        case "podcast":
            return "Podcast"
        case "software":
            return "App"
        case "song":
            return "Song"
        case "tv-episode":
            return "TV Episode"
            
        default:
            break
        }
        
        return "Unknown"
    }
    
    
    /// 使用CodingKeys这个枚举来告诉Codable协议，
    /// 如何让SearchResult这个类中的某些属性如何
    /// 跟服务器返回JSON数据中的字段进行匹配
    enum CodingKeys: String, CodingKey {
        
        // 按指定的名称进行匹配
        case imageSmall = "artworkUrl60"  // 用imageSmall匹配原始字段artworkUrl60
        case imageLarge = "artworkUrl100"
        case itemGenre = "primaryGenreName"
        case bookGenre = "genres"
        case itemPrice = "price"
        
        // 按返回的原始字段进行匹配
        case kind, artistName, currency
        case trackName, trackPrice, trackViewUrl
        case collectionName, collectionViewUrl, collectionPrice
    }
    
    /// 将实例对象以字符串的形式输出(方便人为查看)
    var description: String {
        return "Kind: \(kind ?? ""), Name: \(name), Artist Name: \(artistName)"
    }
}
