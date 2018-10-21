//
//  QuestionView.swift
//  RabbleWabble
//
//  Created by Enrica on 2018/10/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

public class QuestionView: UIView {
    
    /// promptLabel控件
    @IBOutlet public var promptLabel: UILabel!
    
    /// hintLabel控件
    @IBOutlet public var hintLabel: UILabel!
    
    /// answerLabel控件
    @IBOutlet public var answerLabel: UILabel!
    
    /// 错误Label控件
    @IBOutlet public var incorrectCountLabel: UILabel!
    
    /// 正确label控件
    @IBOutlet public var correctCountLabel: UILabel!
}
