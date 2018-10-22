//
//  TitleView.swift
//  分页容器
//
//  Created by Enrica on 2018/10/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * 导航条的父控件，其子控件包括用于显示导航条标题或者图片
 * 的按钮，以及显示滚动位置的指示条
 */

import UIKit

class TitleView: UIView {

    // MARK: - 保存有父控件ContrainerView传递进来的数据
    
    /// 保存由父控件传递进来的titles
    private var titles: [String]
    
    /// 保存由父控件传递进来的imageURLStrings
    private var imageURLStrings: [String]
    
    /// 保存由父控件传递进来的settings
    private var settings: Settings
    
    
    init(frame: CGRect, titles: [String], settings: Settings, imageURLStrings: [String] = []) {
        
        self.titles = titles
        self.imageURLStrings = imageURLStrings
        self.settings = settings
        
        super.init(frame: frame)
        
        // 设置UI界面
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
