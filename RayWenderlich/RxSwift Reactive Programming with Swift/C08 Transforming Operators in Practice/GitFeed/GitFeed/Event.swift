//
//  Event.swift
//  GitFeed
//
//  Created by Enrica on 2018/9/28.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

/// 自定义类型
typealias AnyDict = [String: Any]


class Event {
    
    // MARK: - 模型属性
    
    /// repo
    let repo: String
    
    /// 姓名
    let name: String
    
    /// 插图
    let imageUrl: URL
    
    /// 类型
    let action: String
    
    
    // MARK: - 把JSON转为Event
    init?(dict: AnyDict) {
        
        // 对参数dict进行校验
        guard let repoDict = dict["repo"] as? AnyDict,
            let actor = dict["actor"] as? AnyDict,
            let repoName = repoDict["name"] as? String,
            let actorName = actor["display_login"] as? String,
            let actorUrlString = actor["avatar_url"] as? String,
            let actorUrl  = URL(string: actorUrlString),
            let actionType = dict["type"] as? String
            else {
                return nil
        }
        
        // 初始化私有属性
        repo = repoName
        name = actorName
        imageUrl = actorUrl
        action = actionType
    }
    
    
    // MARK: - 把Event转为JSON
    
    var dict: AnyDict {
        return [
            "repo" : ["name": repo],
            "actor": ["display_login": name, "avatar_url": imageUrl.absoluteString],
            "type" : action
        ]
    }
    
}
