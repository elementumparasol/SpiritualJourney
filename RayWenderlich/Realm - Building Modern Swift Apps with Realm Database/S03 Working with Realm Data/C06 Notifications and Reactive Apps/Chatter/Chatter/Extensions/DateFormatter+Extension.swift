//
//  DateFormatter+Extension.swift
//  Chatter
//
//  Created by Enrica on 2018/12/12.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    /// 用于转换时间格式
    static var mediumTimeFormatter: DateFormatter {
        
        // 创建DateFormatter实例，用于在日期及其文本表示
        // 之间进行转换的格式化程序
        let formatter = DateFormatter()
        
        // 设置日期样式
        formatter.dateStyle = .none
        
        // 设置时间样式
        formatter.timeStyle = .medium
        
        return formatter
    }
}
