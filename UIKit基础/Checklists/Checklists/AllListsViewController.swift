//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Enrica on 2018/8/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    
    // MARK: - 自定义属性
    
    /// 存储Checklist实例对象
    var lists = [Checklist]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 开启导航栏大标题
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 搞一些假数据
        var list = Checklist(name: "生日")
        lists.append(list)

        list = Checklist(name: "杂货店")
        lists.append(list)

        list = Checklist(name: "有趣的Apps")
        lists.append(list)

        list = Checklist(name: "To Do")
        lists.append(list)

        // 搞点假数据用于调试
        for list in lists {
            let item = ChecklistItem()
            item.text = "Item for \(list.name)"
            list.items.append(item)
        }
        
        loadChecklists()
    }

    // MARK: - Table view data source

    
    /// 返回tableView的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }

    /// 返回tableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // 调用makeCell(for: )方法，取出或者创建cell
        let cell = makeCell(for: tableView)
        
        // 取出模型
        let checklist = lists[indexPath.row]
        
        // 设置标题
        cell.textLabel?.text = checklist.name
        
        // 设置cell的附件样式
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }

    /// 根据标识符去缓存池中取出相应的cell；如果没有这样的cell，
    /// 则创建带标识符的cell
    func makeCell(for tableView: UITableView) -> UITableViewCell {
        
        // 创建cell标识符
        let cellIdentifier = "Cell"
        
        // 根据标识符去缓存池中取出cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            
            // 如果没有这样的cell，就创建带标识符的cell
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }
    
    /// 允许用户通过左滑删除cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        lists.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    
    
    // MARK: - UITableViewDelegate
    
    
    /// 告诉代理，指定的行已经被选中
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let checklist = lists[indexPath.row]
        
        // 从当前控制器的storyboard文件中启动指定标识符的segue
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    /// 通知控制器，即将执行一个segue(也就是segue执行的时候调用)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 如果segue的标识符为ShowChecklist
        if segue.identifier == "ShowChecklist" {
            
            // 取出segue的目标控制器，并且将其强制转换为ChecklistViewController
            let controller = segue.destination as! ChecklistViewController
            
            // 将目标控制器的checklist强制转换为Checklist类型，并且解包
            controller.checklist = (sender as! Checklist)
        } else if segue.identifier == "AddChecklist" {
            
            //
            let controller = segue.destination as! ListDetailViewController
            
            //
            controller.delegate = self
        }
    }
    
    /// 告诉代理，用户点击了某一行的accessory控件
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        // 根据标识符，从storyboard中加载指定的控制器
        let controller = storyboard!.instantiateViewController(withIdentifier: "ListDetailViewController") as! ListDetailViewController
        
        // 设置控制器代理
        // controller.delegate = self  // 这句代码是多余的，因为系统默认设置了代理
        
        // 设置导航栏标题
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        // push到指定的控制器
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}



// MARK: - ListDetailViewControllerDelegate
extension AllListsViewController: ListDetailViewControllerDelegate {
    
    /// 取消添加或者编辑Checklist
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    /// 完成Checklist的添加
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist) {
        
        let newRowIndex = lists.count
        lists.append(checklist)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    /// 完成Checklist的编辑
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist) {
        
        if let index = lists.firstIndex(of: checklist) {
            let indexPath = IndexPath(row: index, section: 0)
            
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.textLabel?.text = checklist.name
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}



// MARK: - 获取沙盒中的Documents文件夹
extension AllListsViewController {
    
    /// 获取Documents文件夹路径
    func documentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    /// 创建plist文件的路径
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
}


// MARK: - 沙盒数据的读取和写入
extension AllListsViewController {
    
    /// 将数据写入到沙盒中Documents目录下的.plist文件中
    func saveChecklists() {
        
        // 创建PropertyListEncoder实例
        let encoder = PropertyListEncoder()
        
        // 处理错误(对会抛出异常的方法进行处理)
        do {
            
            // encode方法在无法对目标进行编码时，会抛出异常
            // 所以需要用do-catch对其进行处理
            let data = try encoder.encode(lists)  // Encodable协议
            
            // 如果encode方法执行成功，就将数据些人到目标文件(即Checklists.plist)
            // 因为write(to: options:)方法也会抛出异常，所以这里也要进行异常处理
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            
            // encode方法执行失败时，会进入到catch分支
            print("对items数组进行编码时发生错误!")
        }
    }
    
    /**
     对会抛出异常的方法进行异常处理，有两种常见的方式:
     - (1)、使用try?
     - (2)、在do-catch代码块中使用try
     */
    
    
    /// 读取沙盒中Documents文件夹里面的plist数据
    func loadChecklists() {
        
        // 获取Checklist.plist文件的路径
        let path = dataFilePath()
        
        // 读取Checklist.plist文件中的数据，并且将其转换成Data数据
        if let data = try? Data(contentsOf: path) {
            
            // 创建PropertyListDecoder实例
            let decoder = PropertyListDecoder()
            
            // 对decode方法进行异常处理
            do {
                
                // 对items进行解码
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                
                // 如果decode方法执行失败，则进入到catch分支里面执行print()
                print("对items数组进行解码时发生错误!")
            }
        }
    }
}
