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
    var search: Search!
    
    /// 标记是否为第一次
    private var isFirstTime = true
    
    /// 用于保存downloadTasks
    private var downloadTasks = [URLSessionDownloadTask]()
    
    
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
        
        // 如果是首次搜索
        if isFirstTime {
            isFirstTime = false
            
            switch search.state {
            case .notSearchedYet:
                break
            case .loading:
                // 显示菊花
                showSpinner()
            case .noResults:
                // 显示Nothing Found
                showNothingFoundLabel()
            case .results(let list):
                tileButtons(list)
            }
            
        }
    }
    
    deinit {
        print("--- deinit: LandscapeViewController ---")
        
        // LandscapeViewController实例被销毁时，取消下载
        for downloadTask in downloadTasks {
            downloadTask.cancel()
        }
    }
    
    
    // MARK: - @IBAction
    
    /// pageControl发生改变的时候调用
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(sender.currentPage), y: 0)
        }, completion: nil)
    }
    
    
    // MARK: - 自定义方法
    
    /// 根据搜索结果来创建用于显示数据的按钮
    private func tileButtons(_ searchResults: [SearchResult]) {
        
        var columnsPerPage = 5
        var rowsPerPage = 3
        var itemWidth: CGFloat = 96
        var itemHeight: CGFloat = 88
        var marginX: CGFloat = 0
        var marginY: CGFloat = 20
        
        let viewWidth = scrollView.bounds.size.width
        
        // 适配屏幕
        switch viewWidth {
        case 568:  // 5、5s、SE的屏幕
            columnsPerPage = 6
            itemWidth = 94
            marginX = 2
            
        case 667:  // 6、7、8的屏幕
            columnsPerPage = 7
            itemWidth = 95
            itemHeight = 98
            marginX = 1
            marginY = 29
            
        case 736:  // Plus的屏幕
            columnsPerPage = 8
            rowsPerPage = 4
            itemWidth = 92
            
            // X、XS的屏幕812
            
            // XR、XS Max的屏幕896
            
        default:
            break
        }
        
        // 设置按钮的size
        let buttonWidth: CGFloat = 82
        let buttonHeight: CGFloat = 82
        let paddingHorz = (itemWidth - buttonWidth)/2
        let paddingVert = (itemHeight - buttonHeight)/2
        
        // 创建添加按钮
        var row = 0
        var column = 0
        var x = marginX
        for (_, result) in searchResults.enumerated() {
            
            // 创建按钮(注意，这里按钮类型一定要用.custom，否则会无法显示图片)
            let button = UIButton(type: .custom)
            
            // 设置按钮的背景图片
            button.setBackgroundImage(UIImage(named: "LandscapeButton"), for: .normal)
            
            // 下载网路插图
            downloadImage(for: result, andPlaceOn: button)
            
            // 设置按钮的frame
            button.frame = CGRect(x: x + paddingHorz, y: marginY + CGFloat(row)*itemHeight + paddingVert, width: buttonWidth, height: buttonHeight)
            
            // 添加按钮
            scrollView.addSubview(button)
            
            // 计算下一个按钮的位置
            row += 1
            if row == rowsPerPage {
                row = 0; x += itemWidth; column += 1
                
                if column == columnsPerPage {
                    column = 0; x += marginX * 2
                }
            }
        }
        
        // 设置scrollView的contentSize
        let buttonsPerPage = columnsPerPage * rowsPerPage
        let numPages = 1 + (searchResults.count - 1) / buttonsPerPage
        scrollView.contentSize = CGSize(width: CGFloat(numPages) * viewWidth, height: scrollView.bounds.size.height)
        print("Number of pages: \(numPages)")
        
        // 设置pageControl的numberOfPages的总数量
        pageControl.numberOfPages = numPages
        
        // 设置pageControl的初始位置
        pageControl.currentPage = 0
    }
    
    /// 下载插图数据
    private func downloadImage(for searchResult: SearchResult, andPlaceOn button: UIButton) {
        
        // 从searchResult中获取插图的url字符串，并且将其转换为URL实例
        if let url = URL(string: searchResult.imageSmall) {
            
            // 创建downloadTask
            let downloadTask = URLSession.shared.downloadTask(with: url) {
                
                // 为了防止循环引用，应该以弱引用的方式来捕获button
                [weak button] url, response, error in
                
                // 如果图片下载成功(error == nil)，则对url进行校验
                // 当url有值，就使用Data(contentsOf: )下载数据，并将其转换为data
                // 然后对data进行校验，如果data创建成功，则调用UIImage(data: )
                // 将其转换为图片
                if error == nil,
                    let url = url,
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) {
                    
                    // 回到主线程中设置UI界面
                    DispatchQueue.main.async {
                        
                        // 因为前面用[weak button]来处理循环引用的问题
                        // 因此，此时button有可能为nil。为此，在正式使用
                        // button之前，必须先对其进行校验，确保有值才能使用
                        if let weakButton = button {
                            
                            // 给button设置图片
                            weakButton.setImage(image, for: .normal)
                        }
                    }
                }
                
            }
            
            // 开始执行下载
            downloadTask.resume()
            
            // 将downloadTask保存到downloadTasks数组中
            downloadTasks.append(downloadTask)
        }
    }
    
    /// 显示一个菊花
    private func showSpinner() {
        
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        
        spinner.center = CGPoint(x: scrollView.bounds.midX + 0.5,
                                 y: scrollView.bounds.midY + 0.5)
        
        spinner.tag = 1000
        
        view.addSubview(spinner)
        
        spinner.startAnimating()
    }
    
    /// 隐藏菊花
    private func hideSpinner() {
        
        view.viewWithTag(1000)?.removeFromSuperview()
    }
    
    /// 根据搜索结果来决定是否需要显示按钮插图
    func searchResultsReceived() {
        
        // 隐藏菊花
        hideSpinner()
        
        switch search.state {
        case .loading, .notSearchedYet:
            break
            
        case .noResults:
            showNothingFoundLabel()
            
        case .results(let list):
            
            // 在按钮上显示图片数据
            tileButtons(list)
        }
    }
    
    /// 没有搜索结果信息
    private func showNothingFoundLabel() {
        
        let label = UILabel(frame: .zero)
        label.text = "Nothing Found"
        label.textColor = .white
        label.backgroundColor = .clear
        
        label.sizeToFit()
        
        var rect = label.frame
        rect.size.width = ceil(rect.size.width / 2) * 2
        rect.size.height = ceil(rect.size.height / 2) * 2
        label.frame = rect
        
        label.center = CGPoint(x: scrollView.bounds.midX,
                               y: scrollView.bounds.midY)
        
        view.addSubview(label)
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
