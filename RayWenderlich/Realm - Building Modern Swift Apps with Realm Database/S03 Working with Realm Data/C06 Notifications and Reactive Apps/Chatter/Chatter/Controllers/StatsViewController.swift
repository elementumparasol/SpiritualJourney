//
//  StatsViewController.swift
//  Chatter
//
//  Created by Enrica on 2018/12/10.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import RealmSwift

class StatsViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    /// 显示消息数量的label
    @IBOutlet weak var statsLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    /// 用于存储监听messages时返回的token
    private var messagesToken: NotificationToken?
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取默认的Realm实例
        let realm = try! Realm()
        
        // 从Realm中取出messages
        let messages = realm.objects(Message.self)
        
        // 监听messages
        messagesToken = messages.observe({ [weak self] (_) in
            
            guard let weakSelf = self else { return }
            
            UIView.transition(with: weakSelf.statsLabel, duration: 0.33, options: [.transitionFlipFromTop], animations: {
                weakSelf.statsLabel.text = "Total messages: \(messages.count)"
            }, completion: nil)
        })
    }


}

