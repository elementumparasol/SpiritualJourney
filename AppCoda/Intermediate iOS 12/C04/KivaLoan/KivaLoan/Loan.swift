//
//  Loan.swift
//  KivaLoan
//
//  Created by Enrica on 2018/11/8.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

struct Loans: Codable {
    
    // 从服务器中返回的JSON数据中，最外层的是数组loans
    // 因此，我们需要先对loans进行解码
    var loans = [Loan]()
}

struct Loan: Codable {
    
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        
        case name
        
        // 因为我们使用的是country，而返回的JSON
        // 数据里面使用的是location，因此这里要改
        case country = "location"
        case use
        
        // 返回的JSON数据里面使用的是loan_amount
        case amount = "loan_amount"
    }
    
    // 返回的JSON数据里面，location又是嵌套类型
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    // 手动解码。使用指定的解码器来创建新的解码实例
    init(from decoder: Decoder) throws {
        
        // 返回存储在解码器中的数据
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // 通过指定的键来解码指定类型的值
        name = try values.decode(String.self, forKey: .name)
        use = try values.decode(String.self, forKey: .use)
        amount = try values.decode(Int.self, forKey: .amount)
        
        // 因为从返回的JSON数据中发现，location是一个嵌套类型
        // 因此，我们这里需要使用嵌套的nestedContainer来处理
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        country = try location.decode(String.self, forKey: .country)
    }
}




