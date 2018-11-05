//
//  DiscoverTableViewController.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/5.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CloudKit

class DiscoverTableViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 用于存储CKRecord对象
    var restaurants: [CKRecord] = []
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
        
        // 从iCloud中取出数据
        fetchRecordsFromCloud()
    }
    
    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        // 适配iPad
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // 开启大标题
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 设置导航条为透明
        navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar
            .shadowImage = UIImage()
        
        // 设置标题颜色
        navigationController?.navigationBar
            .largeTitleTextAttributes = [NSAttributedString.Key
                .foregroundColor: UIColor(r: 231, g: 76, b: 60)]
    }
    
    /// 从iCloud中取出数据
    private func fetchRecordsFromCloud() {
        
        // 获取应用程序的默认CloudKit容器
        let cloudContainer = CKContainer.default()
        
        // 获取默认的公共数据库
        let publicDatabase = cloudContainer.publicCloudDatabase
        
        // predicate用于指定如何过滤数据。如果没有predicate
        // 就不能执行CKQuery，即使是在没有任何过滤条件下查询
        // 记录，我们任然要指定一个predicate。我们这里指定的
        // value值为true，意思是不对查询结果执行任何的排序
        let predicate = NSPredicate(value: true)
        
        // 描述在搜索数据库中的记录时所应用的查询条件
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        // 异步查询指定的区域，以便找到符合查询条件的记录(records)
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            
            // 判断是否出错，如果出错就直接退出
            if let error = error {
                print(error)
                return
            }
            
            // 获取records
            if let records = records {
                print("Completed the download of Restaurant data")
                
                // 将records存储到数组restaurant中
                self.restaurants = records
                
                // 因为我们这个方法是异步查询，也就是不是在主线程
                // 中执行。而刷新UI必须回到主线程中去执行
                DispatchQueue.main.async {
                    
                    // 刷新tableView
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    

    // MARK: - UITableViewDataSource

    // 返回tableView中的分组数
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    // 返回tableView中每一组cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurants.count
    }

    // 返回tableView的cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverCell", for: indexPath)
        
        // 取出数据(record)
        let restaurant = restaurants[indexPath.row]
        
        // 设置cell的文字。一个record就是一个键值对
        // 我们使用键值对保存或者取出应用程序中的数据
        cell.textLabel?.text = restaurant
            .object(forKey: "name") as? String
        
        // 通过键值对取出图片数据。因为我们之前在CloudKit中存储
        // 图片时，用的类型是Asset，所以我们这里要将其转换为CKAsset
        if let image = restaurant.object(forKey: "image"),
            let imageAsset = image as? CKAsset {
            
            // 通过imageAsset.fileURL访问下载到本地的Asset数据
            // 然后再将其转换为二进制数据，最后再将其展示出来
            if let imageData = try? Data
                .init(contentsOf: imageAsset.fileURL) {
                
                // 设置cell的图片
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
        
        return cell
    }

}
