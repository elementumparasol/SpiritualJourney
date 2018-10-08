//
//  Functions.swift
//  航班信息
//
//  Created by Enrica on 2018/10/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

/// 延迟执行一段代码
func delay(seconds: Double, completion: @escaping () -> Void) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
