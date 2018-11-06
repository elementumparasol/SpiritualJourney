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
    
    /// 菊花标
    var spinner = UIActivityIndicatorView()
    
    
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
        
        // 设置footerView，一般去掉多余cell的分割线
        tableView.tableFooterView = UIView()
        
        // 设置菊花标
        setActivityIndicatorView()
    }
    
    /// 设置菊花(用户等待时，用户显示正在操作)
    private func setActivityIndicatorView() {
        
        // 设置spinner的样式
        spinner.style = .gray
        
        // 动画停止时，隐藏spinner
        spinner.hidesWhenStopped = true
        
        // 添加spinner到view上面
        view.addSubview(spinner)
        
        // 禁止将spinner的AutoresizingMask转换为自动布局
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        // 对spinner进行手动约束
        NSLayoutConstraint.activate([spinner.topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)])
        
        // 开启spinner
        spinner.startAnimating()
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
        
        // 创建查询操作对象queryOperation
        let queryOperation = CKQueryOperation(query: query)
        
        // 通过desiredKeys指定提取字段(只检索应用程序所需的的字段)
        // 我们这里告诉查询操作对象，我们只需要records的name和image字段
        // queryOperation.desiredKeys = ["name", "image"]
        
        // 因为从iCloud下载图片需要占据大量的时间，所以我们
        // 这里先只下载name，图片放在后面再下载
        queryOperation.desiredKeys = ["name"]
        
        // 通过queuePriority属性来指定查询操作的优先级
        queryOperation.queuePriority = .veryHigh
        
        // 通过resultsLimit属性来设置任何时候执行一次查询的最大数量
        queryOperation.resultsLimit = 50
        
        // 每次只要有record返回，就会执行这个闭包
        queryOperation.recordFetchedBlock = { (record) -> Void in
            
            // 将返回的record存储到数组restaurants中
            self.restaurants.append(record)
        }
        
        // 在获取完所有的records之后，执行相应的闭包
        // 其中参数cursor的类型是CKQueryCursor，它
        // 用于标记查询的停止点和检索剩余结果的起点
        queryOperation
            .queryCompletionBlock = { [unowned self] (cursor, error) -> Void in
                
                // 如果发生错误，就打印相关信息，并且直接返回
                if let error = error {
                    print("Faild to get data from iCloud - \(error.localizedDescription)")
                    return
                }
                
                // 打印执行成功的消息
                print("Successfully retrieve the data from iCloud")
                
                // 回到主线程中去刷新tableView
                DispatchQueue.main.async {
                    
                    // 数据出来以后，停止spinner
                    self.spinner.stopAnimating()
                    self.tableView.reloadData()
                }
        }
        
        // 执行query查询
        publicDatabase.add(queryOperation)
    }
    
    /// 根据指定的recordID取出cell所对应record的图片
    ///
    /// - Parameters:
    ///   - recordIDs: 它是一个数组，是iCloud中所有record所对应的ID
    ///   - cell: tableView的cell
    private func fetchRecordsImage(with recordIDs: [CKRecord.ID], for cell: UITableViewCell) {
        
        // 获取应用程序默认的CloudKit容器和公共数据库
        let publicDatabase = CKContainer.default()
            .publicCloudDatabase
        
        // 初始化并返回一个带有特定recordID的查询操作
        // iCloud中的每一条record都有自己独有的ID。要
        // 获取特定record的图像，只需创建一个
        // CKFetchRecordsOperation对象，然后将该
        // record的的ID传递过去就可以
        let fetchRecordsImageOperation = CKFetchRecordsOperation(recordIDs: recordIDs)
        
        // 通过desiredKeys指定查询字段
        fetchRecordsImageOperation.desiredKeys = ["image"]
        
        // 通过queuePriority指定查询优先级
        fetchRecordsImageOperation.queuePriority = .veryHigh
        
        // 跟queryCompletionBlock批量查询不同，这个是单个查询 [unowned self]
        fetchRecordsImageOperation.perRecordCompletionBlock = { (record, recordID, error) -> Void in
            
            // 校验下载图片是否出错
            if let error = error {
                
                // 如果获取数据出错，则打印错误信息，并且直接退出
                print("Faild to get restaurant image from iCloud - \(error.localizedDescription)")
                
                return
            }
            
            // 先对record数据进行校验，如果record查询成功，则通过
            // 键值取出图片数据，然后再将图片数据转换为CKAsset类型
            if let record = record, let image = record.object(forKey: "image"), let imageAsset = image as? CKAsset {
                
                // 通过imageAsset.fileURL访问下载到本地的Asset数据
                // 然后再将其转换为二进制数据
                if let imageData = try? Data.init(contentsOf: imageAsset.fileURL) {
                    
                    // 回到主线程中去刷新UI
                    DispatchQueue.main.async {
                        
                        // 设置cell的网络图片
                        cell.imageView?.image = UIImage(data: imageData)
                        
                        // 因为占位图片和下载的图片尺寸不同，所有需要调用
                        // setNeedsLayout()重新布局当前cell，以便刷新数据
                        cell.setNeedsLayout()
                    }
                }
            }
        }
        
        // 执行数据查询操作
        publicDatabase.add(fetchRecordsImageOperation)
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
        
        // 设置cell的本地占位图片
        cell.imageView?.image = UIImage(named: "photo")
        
        
        // 取出iCloud中record所对应的图片，并且将其设置到cell上面
        fetchRecordsImage(with: [restaurant.recordID], for: cell)
        
        return cell
    }
}
