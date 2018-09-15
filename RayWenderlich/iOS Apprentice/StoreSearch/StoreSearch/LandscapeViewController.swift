//
//  LandscapeViewController.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class LandscapeViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// scrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    /// pageControl
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // MARK: - 自定义属性
    
    /// 搜索的数据
    var searchResults = [SearchResult]()
    
    /// 标记是否为第一次
    private var isFirstTime = true
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         在storyboard中，如果你没有手动为控件添加约束，那么Interface Builder
         会自动帮你添加。但是，我们并不想要通过storyboard来为控件添加约束，而是
         希望直接通过修改控件frame的方式来添加约束。因此，我们要先移除Interface
         Builder为我们添加的约束，然后再设置
         translatesAutoresizingMaskIntoConstraints为true，让UIKit将我们
         手动设置控件frame的代码转换为自动布局。假如我们在用代码设置控件frame之前
         没有将Interface Builder为我们添加的约束删除的话，那么Interface
         Builder自动为我们添加的约束，以及我们通过代码添加的约束最后被翻译成的自动
         局部约束，它们之间很有可能会产生冲突
         */

        // 从main screen上面移除约束
        view.removeConstraints(view.constraints)
        
        // 将AutoresizingMask转换为自动布局。也就是将我们通过
        // 代码来设置控件的frame转换为自动布局
        view.translatesAutoresizingMaskIntoConstraints = true
        
        // 移除pageControl的约束
        pageControl.removeConstraints(pageControl.constraints)
        pageControl.translatesAutoresizingMaskIntoConstraints = true
        
        // 移除scrollView的约束
        scrollView.removeConstraints(scrollView.constraints)
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        
        
        // 设置scrollView的背景颜色
        scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "LandscapeBackground")!)
        
        // 初始状态下设置pageControl的numberOfPages为0(无数据时的状态)
        pageControl.numberOfPages = 0
        
        // 开启分页效果
        scrollView.isPagingEnabled = true
        
        // 禁用弹簧效果
        scrollView.bounces = false
    }
    
    // 布局子控件的时候调用
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        /**
         我们通过代码来设置scrollView和pageControl的frame
         然后UIKit就会将这些代码转换为自动布局
         */
        
        // 设置scrollView的frame
        scrollView.frame = view.bounds
        
        // 设置pageControl的位置和尺寸
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - pageControl.frame.size.height, width: view.frame.size.width, height: pageControl.frame.size.height)
        
        //
        if isFirstTime {
            isFirstTime = false
            titleButtons(searchResults)
            
        }
    }
    
    deinit {
        print("--- LandscapeViewController ---")
    }
    
    
    // MARK: - @IBAction
    
    ///
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(sender.currentPage), y: 0)
        }, completion: nil)
    }
    
    
    // MARK: - 自定义方法
    
    /// 根据搜索结果来创建用于显示数据的按钮
    private func titleButtons(_ searchResults: [SearchResult]) {
        
        var columnsPerPage = 5
        var rowsPerPage = 3
        var itemWidth: CGFloat = 96
        var itemHeight: CGFloat = 88
        var marginX: CGFloat = 0
        var marginY: CGFloat = 20
        
        let viewWidth = scrollView.bounds.size.width
        
        switch viewWidth {
        case 568:  // 5、5s、SE的屏幕高度(320, 568)
            columnsPerPage = 6
            itemWidth = 94
            marginX = 2
            
        case 667:  // 6、7、8的屏幕高度(375, 667)
            columnsPerPage = 7
            itemWidth = 95
            itemHeight = 98
            marginX = 1
            marginY = 29
            
        case 736:  // Plus屏幕的高度(414, 736)
            columnsPerPage = 8
            rowsPerPage = 4
            itemWidth = 92
            
            // X、XS的屏幕高度(375, 812)
            
            // XR、XS Max的屏幕高度(414, 896)
            
        default:
            break
        }
        
        // 设置按钮的size
        let buttonWidth: CGFloat = 82
        let buttonHeight: CGFloat = 82
        let paddingHorz = (itemWidth - buttonWidth) / 2
        let paddingVert = (itemHeight - buttonHeight) / 2
        
        
        // 添加按钮
        var row = 0
        var column = 0
        var x = marginX
        
        for (index, result) in searchResults.enumerated() {
            
            let button = UIButton(type: .system)
            button.backgroundColor = .white
            button.setTitle("\(index)", for: .normal)
            
            button.frame = CGRect(x: x + paddingHorz, y: marginY + CGFloat(row) * itemHeight + paddingVert, width: buttonWidth, height: buttonHeight)
            
            scrollView.addSubview(button)
            
            row += 1
            if row == rowsPerPage {
                row = 0
                x += itemWidth
                column += 1
                
                if column == columnsPerPage {
                    column = 0
                    x += marginX * 2
                }
            }
        }
        
        
        //
        let buttonPerPage = columnsPerPage * rowsPerPage
        let numPages = 1 + (searchResults.count - 1) / buttonPerPage
        
        // 设置scrollView的contentSize(可滚动区域)
        scrollView.contentSize = CGSize(width: CGFloat(numPages) * viewWidth, height: scrollView.bounds.size.height)
        // print("-- page的数量: \(numPages)")
        
        
        // 设置分页数量，并且让指示器指示第0个位置
        pageControl.numberOfPages = numPages
        pageControl.currentPage = 0
        
    }

}



// MARK: - UIScrollViewDelegate
extension LandscapeViewController: UIScrollViewDelegate {
    
    // scrollView滚动的时候调用
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 获取屏幕宽度
        let width = scrollView.bounds.size.width
        
        // 计算页码
        // 当我们滚动scrollView上面的控件时，contentOffset就可以
        // 用来计算滚动的偏移量。当偏移量超过屏幕宽度的一半时，就滚动
        // 到下一页
        let page = Int((scrollView.contentOffset.x + width / 2) / width)
        
        // 设置当前的页码
        pageControl.currentPage = page
    }
}
