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
    
    /// 用于缓存图片。NSCache是一个泛型，它可以缓存多种类型的
    /// 对象。初始化的时候，只需要在尖括号中提供键值对的类型即可
    /// 在我们这个程序中，key的类型为CKRecord.ID，value的类
    /// 型为NSURL。也就是说，在我们这里，NSCache被设计为，使用
    /// CKRecord.ID类型的键来缓存NSURL对象
    private var imageCache = NSCache<CKRecord.ID, NSURL>()
    
    
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
    
    /// 从本地或者CloudKit中的record里面取出图片数据
    ///
    /// - Parameters:
    ///   - record: 缓存到本地的record，或者从CloudKit中下载的record
    ///   - cell: tableView的cell
    private func fetchImage(from record: CKRecord, for cell: UITableViewCell) {
        
        /**
         * 使用NSCache来缓存图片:
         * - 首先，先检查图片有没有缓存到本地，如果有，则直接去本地取出缓存图片；
         * - 如果图片没有缓存到本地，那么就从网络下载，然后再将其缓存到本地
         */
        
        // 使用缓存图片时使用的key取出value值，也就是imageFileURL
        if let imageFileURL = imageCache.object(forKey: record.recordID) {
            
            // 第一步: 先去缓存中查看有没有图片缓存到本地
            print("Get image from cache...")
            
            // 通过图片的URL路径取出图片以后，将其转换为二进制数据
            if let imageData = try? Data
                .init(contentsOf: imageFileURL as URL) {
                
                // 使用图片的二进制数据将其设置到cell上面去
                cell.imageView?.image = UIImage(data: imageData)
            }
        } else {
            
            // 第二步: 如果图片没有缓存到本地，才回去网络下载
            print("Get image from CloudKit...")
            
            // 获取应用程序默认的CloudKit容器和公共数据库
            let publicDatabase = CKContainer.default()
                .publicCloudDatabase
            
            // 每一个record在CloudKit中都有一个独一无二的recordID
            // 我们可以创建带有recordID的CKFetchRecordsOperation
            // 来获取record中特定的数据
            let fetchImageOperation = CKFetchRecordsOperation(recordIDs: [record.recordID])
            
            // 设置操作字段
            fetchImageOperation.desiredKeys = ["image"]
            
            // 设置优先级
            fetchImageOperation.queuePriority = .veryHigh
            
            // 创建block，执行数据查询
            fetchImageOperation.perRecordCompletionBlock = { [unowned self] (record, recordID, error) -> Void in
                
                // 对error进行校验，如果error有值，则说明发生错误，直接退出
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // 对record进行校验，如果record有值，则说明查询成功
                // 通过字段"image"取出record中的image。由于在CloudKit
                // 中存储图片时，使用的是Asset类型，所以这里需要将取出
                // 的图片转换为CKAsset类型
                if let record = record, let image = record.object(forKey: "image"), let imageAsset = image as? CKAsset {
                    
                    // 将图片缓存到本地
                    self.imageCache.setObject(imageAsset.fileURL as NSURL, forKey: record.recordID)
                    
                    // 将CKAsset类型的图片数据转换为二进制数据
                    if let imageData = try? Data.init(contentsOf: imageAsset.fileURL) {
                        
                        // 回到主线程中去刷新UI界面
                        DispatchQueue.main.async {
                            
                            // 设置cell的图片
                            cell.imageView?.image = UIImage(data: imageData)
                            
                            // 由于占位图片和网络图片的尺寸可能会不一样，所以
                            // 这里需要调用setNeedsLayout()重新布局
                            cell.setNeedsLayout()
                        }
                    }
                    
                }
            }
            
            // 对publicDatabase异步执行当前指定的操作
            publicDatabase.add(fetchImageOperation)
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
        
        // 先设置cell的本地占位图片
        cell.imageView?.image = UIImage(named: "photo")
        
        // 再从restaurant中取出图片，并且将其设置到cell上面
        fetchImage(from: restaurant, for: cell)
        
        return cell
    }
    
    
    
    
}
