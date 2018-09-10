//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/6.
//  Copyright © 2018 Enrica. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {

    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        
        if locationDescription.isEmpty {
            return "(没有描述信息)"
        } else {
            return locationDescription
        }
    }
    
    public var subtitle: String? {
        return category
    }
    
    /// 用于判断Location对象是有拥有图片(photo)
    var hasPhoto: Bool {
        return photoID != nil
    }
    
    /// PhotoURL用于计算图片的全路径
    var photoURL: URL {
        
        // 使用断言来检查photoID是否有值
        // 如果没有值，程序会崩溃并给出信息
        assert(photoID != nil, "没有设置图片ID")
        
        // 给图片命名
        let filename = "Photo-\(photoID!.intValue).jpg"
        
        // 拼接图片在Documents文件夹中的全路径，并且将其返回
        return applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    
    /// 加载图片
    var photoImage: UIImage? {
        
        // 根据路径加载图片，并且将其返回
        return UIImage(contentsOfFile: photoURL.path)
    }
    
    /// 返回图片的ID
    class func nextPhotoID() -> Int {
        
        let userDefaults = UserDefaults.standard
        
        // 用指定的键返回一个整数值，然后在此基础上加1，将其作为currentID
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1
        
        // 每一个NSManagedObject都有一个特殊的ID，但是这个ID是一个
        // 比较特殊的字符串，不宜用来作为图片名称的一部分。为此，我们可
        // 以手动为这些NSManagedObject分配一个整数类型的ID
        userDefaults.set(currentID, forKey: "PhotoID")
        userDefaults.synchronize()
        
        return currentID
    }
    
    /// 删除Location实例时顺便删除它所对应的图片
    func removePhotoFile() {
        if hasPhoto {
            
            do {
                try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("删除图片时发生错误: \(error)")
            }
        }
    }
}
