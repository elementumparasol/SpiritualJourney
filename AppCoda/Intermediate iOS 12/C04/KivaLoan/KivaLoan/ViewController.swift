//
//  ViewController.swift
//  KivaLoan
//
//  Created by Enrica on 2018/11/7.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// API
    private let kivalLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    /// 存储模型数据
    private var loans = [Loan]()
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tableViewCell的估算高度
        tableView.estimatedRowHeight = 92.0
        
        // 让tableView使用估算的高度
        tableView.rowHeight = UITableView.automaticDimension
        
        // 请求网络数据
        getLatestLoans()
    }
    
    
    // MARK: - 自定义方法
    
    /// 获取网络数据
    func getLatestLoans() {
        
        // 校验API
        guard let loanURL = URL(string: kivalLoanURL) else { return }
        
        // 创建URLRequest实例
        let request = URLRequest(url: loanURL)
        
        // 创建一个任务，用于根据指定的URL请求对象来检索URL内容，并且
        // 在任务完成时通过回调来进行相应的处理
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // 校验网络请求是否放生错误
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // 对data进行值绑定
            if let data = data {
                
                // 解析Data数据，并且将返回结果存储到数组loans中
                self.loans = self.parseJsonData(data: data)
                
                // 回到主线程中去刷新tableView
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        // 开始执行task任务
        task.resume()
    }
    
    /// 解析JSON数据
    func parseJsonData(data: Data) -> [Loan] {

        // 创建空的数组loans
        var loans = [Loan]()
        
        // 创建解码器
        let decoder = JSONDecoder()
        
        do {
            
            // 开始解码
            let loansData = try decoder.decode(Loans.self, from: data)
            
            // 将解码的结果存储到数组loans中
            loans = loansData.loans
            
        } catch {
            print(error.localizedDescription)
        }
        
        return loans
    }

    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return loans.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.nameLabel.text = loans[indexPath.row].name
        cell.countryLabel.text = loans[indexPath.row].country
        cell.amountLabel.text = "$\(loans[indexPath.row].amount)"
        cell.useLabel.text = loans[indexPath.row].use
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

