//
//  Function.swift
//  异步闭包和内存管理
//
//  Created by Enrica on 2018/11/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}
