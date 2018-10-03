//
//  Functions.swift
//  登录界面动画
//
//  Created by Enrica on 2018/10/3.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation



/// 按照指定的时间延迟执行指定的操作
///
/// - Parameters:
///   - seconds: 在当前的时间基础上，延迟执行的秒数
///   - completion: 需要执行的函数
func delay(_ seconds: Double, completion: @escaping () -> Void) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
