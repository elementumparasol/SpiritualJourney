//
//  LocationDetailsViewController.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/1.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData


class LocationDetailsViewController: UITableViewController {
    
    // MARK: - @IBOutlet
    
    /// textView控件
    @IBOutlet weak var descriptionTextView: UITextView!
    
    /// categoryLabel控件
    @IBOutlet weak var categoryLabel: UILabel!
    
    /// latitudeLabel控件
    @IBOutlet weak var latitudeLabel: UILabel!
    
    /// longitudeLabel控件
    @IBOutlet weak var longitudeLabel: UILabel!
    
    /// addressLabel控件
    @IBOutlet weak var addressLabel: UILabel!
    
    /// dateLabel控件
    @IBOutlet weak var dateLabel: UILabel!
    
    /// 用于显示添加照片的imageView控件
    @IBOutlet weak var imageView: UIImageView!
    
    /// 添加照片时的UILabel提示控件
    @IBOutlet weak var addPhotoLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    
    /// 经纬度(包含通过locationManager获取到的location信息，如经纬度)
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    /// 地标信息(包含街道和城市信息)
    var placemark: CLPlacemark?
    
    /// 创建DateFomatter
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    /// 分类的名称
    var categoryName = "暂无分类"
    
    /// 用于创建和存取ManagedObject
    var managedObjectContext: NSManagedObjectContext!
    
    /// 用于存储当前的Date
    var date = Date()
    
    /// 用于存储Location数据(对它的值进行监听)
    var locaitonToEdit: Location? {  // 它里面的值由
        
        didSet {
            
            // 对locationToEdit的值进行校验，如果有值，就将其赋值给location
            if let location = locaitonToEdit {
                
                // 重新给相关的属性赋值
                descriptionText = location.locationDescription
                categoryName = location.category
                date = location.date
                coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
                placemark = location.placemark
            }
        }
    }
    
    /// 描述location的文本
    var descriptionText = ""
    
    /// 用于存储用户选择使用的照片
    var image: UIImage?
    
    
    
    // MARK: - @IBAction
    
    
    /// 点击导航栏上面的完成按钮
    @IBAction func done() {
        
        // 创建HUD
        let hudView = HudView.hud(inView: navigationController!.view, animated: true)
        
        let location: Location
        
        // 对LocationToEdit的值进行校验，如果它有值，就将其赋值给tmp
        if let tmp = locaitonToEdit {
            
            // 修改HUD的提示文字
            hudView.text = "已修改"
            
            // 将tmp赋值给location
            location = tmp
        } else {
            
            // 如果locaitonToEdit没有值，则设置HUD的提示文字为Tagged
            hudView.text = "已标记"
            
            // 通过Location的init(context: )方法给location赋值
            location = Location(context: managedObjectContext)
        }
        
        // 给location实例的属性赋值
        location.locationDescription = descriptionTextView.text
        location.category = categoryName
        location.latitude = coordinate.latitude
        location.longitude = coordinate.longitude
        location.date = date
        location.placemark = placemark
        
        // 调用save()方法保存context。因为save()方法是一个可失败
        // 的方法(在执行过程中可能会抛出异常)，所以需要对异常进行处理
        do {
            try managedObjectContext.save()
            
            // 使用GCD来延迟执行隐藏HUD和退出栈顶控制器
            afterDelay(0.6) {
                
                // 在退出当前控制器之前隐藏HUD
                hudView.hide()
                
                // 从导航栏堆栈中退出栈顶控制器
                self.navigationController?.popViewController(animated: true)
            }
        } catch {
            
            // 终止程序，并且捕捉异常情况
            fatalCoreDataError(error)
        }
        
        
    }
    
    /// 点击导航栏上面的取消按钮
    @IBAction func cancel() {
        
        // 从导航栏堆栈中退出栈顶控制器
        navigationController?.popViewController(animated: true)
    }
    
    /// Unwind Segue to CategoryPickerViewController
    @IBAction func categoryPickerDidPickCategory(_ segue: UIStoryboardSegue) {
        
        // 通过source取出segue的源控制器
        let controller = segue.source as! CategoryPickerViewController
        
        // 将源控制器中的数据回传到当前控制器的categoryName中
        categoryName = controller.selectedCategoryName
        
        // 再将categoryName中的数据设置到categoryLabel上面
        categoryLabel.text = categoryName
    }
    
    
    // MARK: - 类自带的方法
    
    /// 控制器view即将显示的时候调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 显示导航条
        navigationController?.isNavigationBarHidden = false
    }
    
    /// 控制器的view加载完毕之后调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 对locaitonToEdit进行校验
        if let _ = locaitonToEdit {
            
            // 如果locaitonToEdit有值，则重新设置title
            title = "编辑位置"
        }
        
        descriptionTextView.text = descriptionText
        categoryLabel.text = categoryName
        
        // 设置经纬度信息
        latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
        longitudeLabel.text = String(format: "%.8f", coordinate.longitude)
        
        // 设置地址信息
        if let placemark = placemark {
            addressLabel.text = string(from: placemark)
        } else {
            addressLabel.text = "暂无地址信息"
        }
        
        // 设置时间信息
        dateLabel.text = format(date: date)
        
        
        
        // 创建tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        
        // 设置cancelsTouchesInView的值为false
        tapGesture.cancelsTouchesInView = false
        
        // 将tapGesture手势添加到tableView中
        tableView.addGestureRecognizer(tapGesture)
    }
    
    /// 执行segue的时候调用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 根据segue标识符取出对应的控制器，然后将categoryName传递过去
        if segue.identifier == "PickCategory" {
            let controller = segue.destination as! CategoryPickerViewController
            controller.selectedCategoryName = categoryName
        }
    }
    
    
    // MARK: - 自定义方法
    
    /// 获取详细的地址信息(国家 省 市 区 街道 门牌号 邮编)
    func string(from placemark: CLPlacemark) -> String {
        
        // 用于存储详细的地址信息
        var text = ""
        
        /**
         按照中国人的习惯，将国家信息放在最前面，即
         - 中国，上海，上海市，杨浦区，街道信息，门牌号，邮编信息
         */
        
        // 国家信息
        if let s = placemark.country {
            text += s + " "
        }
        
        // 州或者省级信息
        if let s = placemark.administrativeArea {
            text += s + " "
        }
        
        // 城市信息
        if let s = placemark.locality {
            text += s + " "
        }
        
        // 街道信息
        if let s = placemark.thoroughfare {
            text += s + " "
        }
        
        // 街道详细信息
        if let s = placemark.subThoroughfare {
            text += s + " "
        }
        
        // 邮编信息
        if let s = placemark.postalCode {
            text += s + ", "
        }
        
        return text
    }
    
    /// 显示时间信息(将时间转换为字符串，以便于阅读)
    func format(date: Date) -> String {
        
        return dateFormatter.string(from: date)
    }
    
    /// 隐藏键盘(除了textView里面之外，点击tableView的任何位置，都将退出键盘)
    @objc func hideKeyboard(_ gestureRecognizer: UIGestureRecognizer) {
        
        // 获取鼠标点击的坐标(tap position)
        let point = gestureRecognizer.location(in: tableView)
        
        // 通过坐标获取与之对应的indexPath
        let indexPath = tableView.indexPathForRow(at: point)
        
        // 当indexPath的值为nil时，一般表示点击的区域是tableView的hearder或者footer
        // 我们需要的效果是，只要不是点击第0组的第0行，点击tableView中的任意地方，都要让
        // 键盘退下去
        if indexPath == nil || !(indexPath?.section == 0 && indexPath?.row == 0) {
            
            // 除了第0组的第0行之外，点击tableView的任何地方都将退出键盘
            descriptionTextView.resignFirstResponder()
        }
        
        
    }
    
    
    
    
}



// MARK: - UITableViewDelegate
extension LocationDetailsViewController {
    
    // 在加载tableViewCell的时候调用
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // 根据实际情况调整cell的高度
        switch (indexPath.section, indexPath.row) {
            
        // 设置第0组第0行cell的高度(用于描述的textView所在行)
        case (0, 0):
            return 88
            
        // 设置第1组所有cell的高度(添加照片所在行)
        case (1, _):
            
            // 如果imageView是被隐藏的，那么它所在cell的高度为44
            // 如果imageView是可见的，那么它所在cell的高度就为280
            return imageView.isHidden ? 44 : 280
            
        // 设置第2组第2行cell的高度(地址label所在行)
        case (2, 2):
            
            addressLabel.frame.size = CGSize(width: view.bounds.size.width - 120, height: 1000)
            addressLabel.sizeToFit()
            addressLabel.frame.origin.x = view.bounds.size.width - addressLabel.frame.size.width - 16
            return addressLabel.frame.size.height + 20
          
        // 其它cell的高度沿用默认高度44
        default:
            return 44
        }
        
    }
    
    // 某一行cell即将被选中的时候调用
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        // 只让第0组和第1组cell被选中。因为第0组的第0行需要填写
        // 描述信息，而第1组需要选择照片，所以这两组都需要能被选中
        if indexPath.section == 0 || indexPath.section == 1 {
            return indexPath
        } else {
            return nil  // 其它组cell不需要做任何事情，所以他们需要被选中功能
        }
    }
    
    // 某一行cell被选中的时候调用
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 第0组的第0行cell被选中的时候
        if indexPath.section == 0 && indexPath.row == 0 {
            
            // 让descriptionTextView成为第一响应者
            descriptionTextView.becomeFirstResponder()
        } else if indexPath.section == 1 && indexPath.row == 0 {
            
            // 如果用户点击的是第1组的第0行(也就是点击"添加照片"所在的行)
            
            
            // 使用相机
            // takePotoWithCamera()
            
            // 使用系统相册
            // choosePhotoFromLibrary()
            
            // 取消cell选中时背景颜色变暗的效果
            tableView.deselectRow(at: indexPath, animated: true)
            
            // 选择拍照还是直接访问系统相册
            pickPhoto()
        }
    }
}



//extension LocationDetailsViewController {
//
//    //
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if indexPath.section == 0 && indexPath.row == 0 {
//            return 88
//        } else if indexPath.section == 1 && indexPath.row == 0 {
//
//            if imageView.isHidden {
//                return 44
//            } else {
//                return 280
//            }
//        } else {
//            return 44
//        }
//    }
//}


// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension LocationDetailsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - UIImagePickerControllerDelegate
    
    // 完成操作以后调用
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // UIImagePickerControllerEditedImage在Swift 4.2中被新的名称取代了
        // 字典info中存放的就是用户选择使用的照片
        image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 对照片进行校验，如果照片不为空时，将其显示出来
        if let theImage = image {
            
            // 显示照片
            show(image: theImage)
        }
        
        // 刷新tableView
        tableView.reloadData()
        
        // 从屏幕上移除imagePicker控制器
        dismiss(animated: true, completion: nil)
    }
    
    // 点击取消操作的时候调用
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // 从屏幕上移除imagePicker控制器
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - 与相机和系统相册相关的自定义方法
    
    
    /// 使用相机
    func takePotoWithCamera() {
        
        // 创建UIImagePickerController实例
        let imagePicker = UIImagePickerController()
        
        // 设置imagePicker的属性
        imagePicker.sourceType = .camera  // 模拟器没有相机，所以会崩溃，但是真机不会
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        // 以modal的方式弹出imagePicker控制器
        present(imagePicker, animated: true, completion: nil)
    }
    
    /// 访问系统相册
    func choosePhotoFromLibrary() {
        
        // 创建UIImagePickerController实例对象
        let imagePicker = UIImagePickerController()
        
        // 设置相关的属性
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        // 弹出imagePicker控制器
        present(imagePicker, animated: true, completion: nil)
    }
    
    /// 照片库选项
    func pickPhoto() {
        
        // 判断相机是否可用
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            // 如果相机可用，可选择使用相机拍照，还是直接访问相册
            showPhotoMenu()
        } else {
            
            // 如果相机不可用，则直接进入访问相册模式
            choosePhotoFromLibrary()
        }
    }
    
    
    /// 显示照片库选项(拍照或者访问系统相册)
    func showPhotoMenu() {
        
        // 创建UIAlertController实例
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 取消选项
        let actCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        
        // 拍照选项
        let actPhoto = UIAlertAction(title: "拍照", style: .default, handler: { _ in
            
            // 使用相机拍照
            self.takePotoWithCamera()
        })
        alert.addAction(actPhoto)
        
        // 访问系统相册选项
        let actLibrary = UIAlertAction(title: "访问相册", style: .default, handler: { _ in
            
            // 直接访问系统相册
            self.choosePhotoFromLibrary()
        })
        alert.addAction(actLibrary)
        
        // 弹出alert控制器
        present(alert, animated: true, completion: nil)
    }
    
    /// 显示照片
    func show(image: UIImage) {
        
        // 将照片添加到imageView控件上去
        imageView.image = image
        imageView.isHidden = false
        imageView.frame = CGRect(x: 10, y: 10, width: 260, height: 260)
        
        // 隐藏addPhotoLabel控件
        addPhotoLabel.isHidden = true
    }
    
    
    
}


/**
 (1)、首先，从LocationDetailsViewController跳转到CategoryPickerViewController
     它会现执行LocationDetailsViewController中的prepare方法
 (2)、然后点击CategoryPickerViewController中的cell，此时会执行Unwind Segue关闭当
     前控制器，回到LocationDetailsViewController。不过，在回到LocationDetailsViewController之前，它会先调用CategoryPickerViewController这个控制器中的prepare方法，因此，我们可以在
     prepare方法中先给selectedCategoryName属性赋值
 (3)、当我们回到LocationDetailsViewController这个控制器之后，CategoryPickerViewController控制器中的selectedCategoryName属性已经有值了，此时
     系统会执行Unwind Segue，也就是调用categoryPickerDidPickCategory()方法，然后我们
     就可以把CategoryPickerViewController中的值回传过来
 
 方法的调用顺序依次为:
    - LocationDetailsViewController --- prepare
    - CategoryPickerViewController --- prepare
    - LocationDetailsViewController --- categoryPickerDidPickCategory
 */
