//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/6.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation


class LocationsViewController: UITableViewController {
    
    // MARK: - 自定义属性
    
    /// 获取managedObjectContext(从AppDelegate中传递过来)
    var managedObjectContext: NSManagedObjectContext!
    
    /// 用于存储从CoreData Store中取出的数据
    /// var locations = [Location]()
    lazy var fetchedResultsController: NSFetchedResultsController<Location> = {
        
        let fetchRequest = NSFetchRequest<Location>()
        
        let entity = Location.entity()
        fetchRequest.entity = entity
        
        // let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        // 创建描述符
        let sort1 = NSSortDescriptor(key: "category", ascending: true)
        let sort2 = NSSortDescriptor(key: "date", ascending: true)
        
        // 按照描述符进行排序
        fetchRequest.sortDescriptors = [sort1, sort2]
        
        // 每次取出20个
        fetchRequest.fetchBatchSize = 20
        
        // fetch的结果将按照category属性的值进行分组
        let fetchdResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: "category", cacheName: "Locations")
        
        fetchdResultsController.delegate = self
        
        return fetchdResultsController
    }()
    
    
    // MARK: - 类自带的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 从Core Data Store中取出数据，并且将其存储到数组locations中
        // fetchRequestFromCoreData()
        
        // NSFetchedResultsController<Location>.deleteCache(withName: "Locations")
        performFetch()
        
        // 在cell左边添加删除按钮
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    /// 执行segue的时候调用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 判断是否是指定的标识符
        if segue.identifier == "EditLocation" {
            
            // 根据指定的标识符取出与之对应的Controller
            let controller = segue.destination as! LocationDetailsViewController
            
            // 将managedObjectContext传递过去
            controller.managedObjectContext = managedObjectContext
            
            // 获取indexPath
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                
                // 通过indexPath取出与之对应的location数据
                // let location = locations[indexPath.row]
                let location = fetchedResultsController.object(at: indexPath)
                
                // 将location数据传递过去
                controller.locaitonToEdit = location
            }
        }
    }
    
    deinit {
        fetchedResultsController.delegate = nil
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - 自定义方法
    
    /*
    /// 从CoreData Store中取出location数据
    func fetchRequestFromCoreData() {
        
        // NSFetchRequest主要用于描述从数据库中获取的对象
        // 如果要检索之前保存到数据库中的数据，就必须创建
        // NSFetchRequest实例对象。在使用NSFetchRequest
        // 的时候，必须要告诉它即将fetch的对象是什么类型
        let fetchRequest = NSFetchRequest<Location>()  // 泛型数组
        
        // 创建Location实体
        let entity = Location.entity()
        
        // 告诉fetchRequest实例，现在需要查找Location实体
        fetchRequest.entity = entity
        
        // 通过NSSortDescriptor实例告诉fetchRequest对date属性
        // 按照时间升序进行排序
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            
            // 告诉context，开始执行fetchRequest。fetch()方法
            // 要么返回一个已经排序好了数组，要么会抛出异常。如果操作
            // 成功，则将取出的数据赋值给数组locations
            locations = try managedObjectContext.fetch(fetchRequest)
        } catch {
            fatalCoreDataError(error)
        }
    }
    */
    
    /// 执行fetchedResultsController的fetch操作
    func performFetch() {
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalCoreDataError(error)
        }
    }
    
    
    
    
    
    
}



// MARK: - UITableViewDataSource
extension LocationsViewController {
    
    // 返回tableView中的分组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    // 设置分组头部标题
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.name
    }

    // 返回tableView中每一组cell的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // fetchdResultsController的sections属性会返回一个
        // NSFetchedResultsSectionInfo数组，该数组用于描述
        // tableView中的每一组(即每一个Section)数据
        let sectionInfo = fetchedResultsController.sections![section]
        
        // tableView中每一组的行数由sectionInfo中的
        // numberOfObjects属性描述，直接返回它就可以
        return sectionInfo.numberOfObjects
    }

    // 返回cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 根据可重用标识符取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        
        // 从数组locations中取出location数据
        // let location = locations[indexPath.row]
        
        // 现在不用问locations要数据了，而是直接通过indexPath问
        // fetchedResultsController要数据
        let location = fetchedResultsController.object(at: indexPath)
        
        // 调用configure(for: )方法，给cell设置数据
        // 从面相对象的角度来讲，一般自己的事情应该交给自
        // 己去做。所以，给cell设置数据的细节应该封装在
        // LocationCell这个类中
        cell.configure(for: location)

        return cell
    }
    
    // 对tableView中的cell进行编辑(删除tableView中的数据)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 判断是否为删除
        if editingStyle == .delete {
            
            // 如果是删除，则根据indexPath取出与之对应的location数据
            let location = fetchedResultsController.object(at: indexPath)
            
            // 从managedObjectContext中删除指定的location数据
            managedObjectContext.delete(location)
            
            // 删除完数据之后，需要对managedObjectContext进行
            // 保存。有因为save()会抛出异常，所以需要进行异常处理
            do {
                try managedObjectContext.save()
            } catch {
                fatalCoreDataError(error)
            }
        }
    }
    
    
    
}


// MARK: - NSFetchedResultsControllerDelegate
extension LocationsViewController: NSFetchedResultsControllerDelegate {
    
    //
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("*** controllerWillChangeContent")
        
        tableView.beginUpdates()
    }
    
    //
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            print("*** NSFetchedResultsChangeInsert (object)")
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            print("*** NSFetchedResultsChangeDelete (object)")
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            print("*** NSFetchedResultsChangeUpdate (object)")
            if let cell = tableView.cellForRow(at: indexPath!) as? LocationCell {
                
                let location = controller.object(at: indexPath!) as! Location
                
                cell.configure(for: location)
            }
        case .move:
            print("*** NSFetchedResultsChangeMove (object)")
            tableView.deleteRows(at: [indexPath!], with: .fade)
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        }
    }
    
    //
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            print("*** NSFetchedResultsChangeInsert (section)")
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            print("*** NSFetchedResultsChangeDelete (section)")
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .update:
            print("*** NSFetchedResultsChangeUpdate (section)")
        case .move:
            print("*** NSFetchedResultsChangeMove (section)")
        }
    }
    
    //
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("*** controllerDidChangeContent")
        
        
        tableView.endUpdates()
    }
    
}
