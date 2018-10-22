//
//  Settings.swift
//  分页容器
//
//  Created by Enrica on 2018/10/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class Settings: NSObject {
    
    // MARK: - titleView和contentView公用的属性
    
    /// 默认被选中的index
    var selectedIndex: Int = 0
    
    
    
    // MARK: - 和titleView相关的属性
    
    /// titleView的背景颜色
    var titleBackgroundColor = UIColor.white
    
    /// titleView的高度(如果外界不传，默认为44)
    var titleViewHeight: CGFloat = 44
    
    /// titleView中的标题按钮是否可以滚动(默认为不可以滚动)
    var isScrollEnable: Bool = false
    
    /// titleView中的按钮可以滚动时，label之间的间距
    var labelMargin: CGFloat = 20
    
    /// titleView中按钮上面文字的大小(默认为14)
    var titleFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    /// titleView中按钮文字默认状态下的颜色
    var defaultTextColor = UIColor(r: 0, g: 0, b: 0)
    
    /// titleView中按钮在被选中的时的颜色
    var selectedTextColor = UIColor(r: 225, g: 127, b: 0)
    
    /// 是否需要渐进式动画(切换标题时颜色渐变，指示器有毛毛虫效果，默认不需要)
    var isNeedProgressiveAnimation: Bool = false
    
    /// 是否显示titleView底部选中标题指示器(默认不显示)
    var showsTitleIndicator: Bool = false
    
    /// titleView底部选中标题指示器的宽度
    var titleIndicatorWidth : CGFloat = 15  // 10
    
    /// titleView底部选中标题指示器的高度
    var titleIndicatorHeight : CGFloat = 3  // 3
    
    /// titleView底部选中标题指示器的背景颜色
    var titleIndicatorBackgroundColor = UIColor.orange
    
    /// 分割线的高度
    var dividingLineHeight: CGFloat = 0.5
    
    /// 分割线的背景颜色
    var dividingLineBackgroundColor: UIColor = .lightGray
    
    /// 是否需要对TitleView上面被选中的标题进行缩放(默认不缩放)
    var needsToScale : Bool = false
    
    /// 标题TitleView上面文字缩放的范围
    var scaleRange : CGFloat = 1.1
    
    
    
    // MARK: - 和contentView相关的属性
    
    
}
