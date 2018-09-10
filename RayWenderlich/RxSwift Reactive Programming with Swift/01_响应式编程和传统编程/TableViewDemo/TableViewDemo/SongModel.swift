//
//  SongModel.swift
//  TableViewDemo
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

@objcMembers
class SongModel: NSObject {
    
    /// 歌曲名称
    var song: String = ""
    
    /// 演唱者
    var singer: String = ""
    
    // 将字典转为模型
    init(dict: [String: String]) {
        super.init()
        
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //
    }
}
