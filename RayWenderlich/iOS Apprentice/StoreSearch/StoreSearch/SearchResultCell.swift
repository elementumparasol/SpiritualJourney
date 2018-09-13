//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var artworkImageView: UIImageView!
    
    /// name
    @IBOutlet weak var nameLabel: UILabel!
    
    /// artistName
    @IBOutlet weak var artistNameLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    /// 存储downloadTask
    var downloadTask: URLSessionDownloadTask?
    
    
    // MARK: - 类自带的方法

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置cell被选中时的颜色
        let selectedView = UIView(frame: .zero)
        selectedView.backgroundColor = UIColor(red: 20/255.0, green: 160/255.0, blue: 160/255.0, alpha: 0.5)
        selectedBackgroundView = selectedView
    }
    
    /// 因为tableView的cell有重用机制，所以从
    /// 理论上讲，你很有可能会重用到上一次的cell
    /// 为了不会错误的使用上一次的数据，有必要在
    /// 使用cell之前，先将上一次可能存在的数据清理掉
    override func prepareForReuse() {
        super.prepareForReuse()
        print("--- prepareForReuse ---")
        downloadTask?.cancel()
        downloadTask = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - 自定义方法
    
    /// 设置cell上面的数据
    func configure(for result: SearchResult) {
        
        // 给nameLabel设置文字
        nameLabel.text = result.name
        
        // 给artistNameLabel设置文字
        if result.artistName.isEmpty {
            artistNameLabel.text = "Unknown"
        } else {
            artistNameLabel.text = String(format: "%@ (%@)", result.artistName, result.type)
        }
        
        // 给artworkImageView设置图片
        artworkImageView.image = UIImage(named: "Placeholder")
        if let smallURL = URL(string: result.imageSmall) {
            downloadTask = artworkImageView.loadImage(url: smallURL)
        }
    }

}
