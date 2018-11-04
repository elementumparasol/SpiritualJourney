//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/5.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 分组标题
    var sectionTitles = ["Feedback", "Follow Us"]
    
    /// 分组内容
    var sectionContent = [[(image: "store", text: "Rate us on App Store", link: "https://www.apple.com/itunes/charts/paid-apps/"),
        (image: "chat", text: "Tell us your feedback", link: "http://www.appcoda.com/contact")],
        [(image: "twitter", text: "Twitter", link: "https://twitter.com/appcodamobile"),
        (image: "facebook", text: "Facebook", link: "https://facebook.com/appcodamobile"),
        (image: "instagram", text: "Instagram", link: "https://www.instagram.com/appcodadotcom")]]
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 判断是否为指定的segue标识符
        if segue.identifier == "showWebView" {
            
            // 获取目标控制器和选中cell的indexPath
            if let destinationController = segue
                .destination as? WebViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                
                // 将url字符串传递给目标控制器
                destinationController
                    .targetURL = sectionContent[indexPath.section][indexPath.row].link
            }
        }
    }
    
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 适配iPad屏幕
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // 开启大标题
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 设置导航条的背景图片
        navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        
        // 设置导航条的阴影图片
        navigationController?.navigationBar
            .shadowImage = UIImage()
        
        // 设置导航条的字体颜色
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(r: 231, g: 76, b: 60), NSAttributedString.Key.font: customFont]
        }
        
        // 设置导航条的footerView(去掉多余的分割线)
        tableView.tableFooterView = UIView()
    }

    
    // MARK: - UITableViewDataSource

    // 返回分组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitles.count
    }

    // 返回每一个分组中的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionContent[section].count
    }

    // 返回cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)
        
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)
        
        return cell
    }
    
    // 返回每一组header的标题
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]
    }
    
    
    // MAKR: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 取出链接地址
        let link = sectionContent[indexPath.section][indexPath.row].link
        
        switch indexPath.section {
            
        case 0:
            if indexPath.row == 0 {
                
                // 获取网页链接的URL地址
                if let url = URL(string: link) {
                    
                    // 通过Safari浏览器打开这个链接
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            } else if indexPath.row == 1 {
                
                // 跳转到指定的控制器
                performSegue(withIdentifier: "showWebView", sender: self)
            }
            
        default:
            break
        }
        
        // 取消点击cell时被选中
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
