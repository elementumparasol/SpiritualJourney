//
//  ViewController.swift
//  航班信息
//
//  Created by Enrica on 2018/10/3.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 枚举常量
    
    /// 确定动画执行方向
    enum AnimationDirection: Int {
        
        /// 正方向
        case positive = 1
        
        /// 反方向
        case negative = -1
    }
    
    // MARK: - @IBOutlet
    
    /// 背景图片
    @IBOutlet weak var bgImageView: UIImageView!
    
    /// 顶部用于显示起飞信息的图标
    @IBOutlet weak var summaryIcon: UIImageView!
    
    /// 顶部用于显示航班起飞信息的label
    @IBOutlet weak var summaryLabel: UILabel!
    
    /// 航班号
    @IBOutlet weak var flightNr: UILabel!
    
    /// 出站口
    @IBOutlet weak var gateNr: UILabel!
    
    /// 出发地
    @IBOutlet weak var departingFrom: UILabel!
    
    /// 目的地
    @IBOutlet weak var arrivingTo: UILabel!
    
    /// 用于显示飞机的图片控件
    @IBOutlet weak var planeImage: UIImageView!
    
    /// 用于显示航班状态的控件
    @IBOutlet weak var statusImage: UIImageView!
    
    /// 飞行状态
    @IBOutlet weak var statusLabel: UILabel!
    
    
    // MARK: - 自定义属性
    
    /// 雪花发射器
    var snowView: SnowView!
    
    
    // MARK: - 类自带的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
        
        // 接入航班数据，默认是从上海飞哈尔滨
        // 并且第一次进入界面不需要执行动画
        changeFlight(to: shanghaiToHaerbin)
    }

    
    // MARK: - 自定义方法
    
    /// 统一设置UI界面
    private func setupUI() {
        
        /** 1、处理顶部航班起飞信息 */
        
        // 将summaryIcon添加到summaryLabel上面
        summaryLabel.addSubview(summaryIcon)
        
        // 设置summaryIcon中心点y的坐标
        summaryIcon.center.y = summaryLabel.frame.size.height / 2.0
        
        
        /** 2、添加雪花 */
        
        // 创建雪花发射器，坐标为负数表示将其隐藏在屏幕外面
        snowView = SnowView(frame: CGRect(x: -150, y: -100, width: 300, height: 50))
        
        // 创建一个UIView实例snowClipView，用于作为雪花snowView的容器
        // 以方便后续整体操作。y轴向下偏移50，主要是为了不遮住顶部航班信息
        let snowClipView = UIView(frame: view.frame.offsetBy(dx: 0, dy: 50))
        
        // 将超出边界的部分裁剪掉(主要是为了让顶部显示航班信息的不为不出现雪花)
        snowClipView.clipsToBounds = true
        
        // 将雪花发射器添加到容器控件snowClipView上面
        snowClipView.addSubview(snowView)
        
        // 将容器控件snowClipView添加到控制器的view上面
        view.addSubview(snowClipView)
    }
    
    
    /// 切换不同的航班(接入数据)
    ///
    /// - Parameters:
    ///   - data: 航班数据
    ///   - animated: 是否需要执行动画
    private func changeFlight(to data: FlightData, animated: Bool = false) {
        
        // 航班的起飞信息
        summaryLabel.text = data.summary
        
        // 是否需要执行动画
        if animated {
            
            /**
             过了一定的时间之后，界面需要切换到另一个场景，
             所以，在切换数据场景的同时，还需要执行动画
             */
            
            /** 1、给背景图片添加淡入淡出动画 */
           
            // 切换背景图片，并且添加淡入淡出动画，同时
            // 根据实际情况来决定是否需要显示雪花发射器
            fade(imageView: bgImageView, toImage: UIImage(named: data.weatherImageName)!, showEffects: data.showWeatherEffects)
            
            
            /** 2、给航班号和出站口添加cube动画 */
            
            // 创建动画执行的方向
            let direction: AnimationDirection = data.isTakingOff ? .positive : .negative
            
            // 给航班号添加cube动画
            cubeTransition(label: flightNr, text: data.flightNr, direction: direction)
            
            // 给出站口添加cube动画
            cubeTransition(label: gateNr, text: data.gateNr, direction: direction)
            
            
            /** 3、给起飞地和目的地label添加动画 */
            
            // 计算起飞地label的偏移量
            let offsetDeparting = CGPoint(x: CGFloat(direction.rawValue * 80), y: 0.0)
            
            // 给起飞地label添加动画
            moveLabel(label: departingFrom, text: data.departingFrom, offset: offsetDeparting)
            
            // 计算目的地label的偏移量
            let offsetArriving = CGPoint(x: 0.0, y: CGFloat(direction.rawValue * 50))
            
            // 给目的地label添加动画
            moveLabel(label: arrivingTo, text: data.arrivingTo, offset: offsetArriving)
            
            
        } else {
            
            /**
             程序第一次运行时，显示的是上海飞哈尔滨，
             不需要执行切换动画，直接显示相应的数据
             */
            
            // 切换背景图片
            bgImageView.image = UIImage(named: data.weatherImageName)
            
            // 隐藏雪花发射器
            snowView.isHidden = !data.showWeatherEffects
            
            // 航班号
            flightNr.text = data.flightNr
            
            // 出站口信息
            gateNr.text = data.gateNr
            
            // 起飞地信息
            departingFrom.text = data.departingFrom
            
            // 目的地信息
            arrivingTo.text = data.arrivingTo
            
            // 航班状态
            statusLabel.text = data.flightStatus

        }
        
        // 切换到下一个航班，需要执行相应的动画
        delay(seconds: 3.0) {
            
            // 通过判断飞机是否起飞来切换数据
            // 如果飞机起飞，就接入哈尔滨飞三亚的数据
            // 如果延误，就接入上海飞哈尔滨的数据
            self.changeFlight(to: data.isTakingOff ? haerbinToSanya : shanghaiToHaerbin, animated: true)
        }
    }

}


// MARK: - 给界面切换增加动画效果
extension ViewController {
    
    
    /// 切换背景图片并执行相应的动画
    ///
    /// - Parameters:
    ///   - imageView: 用于设置背景图片的imageView控件
    ///   - toImage: 用于切换背景的image图片
    ///   - showEffects: 是否显示雪花发射器
    private func fade(imageView: UIImageView, toImage: UIImage, showEffects: Bool) {
        
        // 切换背景图片，并且添加淡入淡出的动画效果
        UIView.transition(with: imageView, duration: 1.0, options: .transitionCrossDissolve, animations: {
            imageView.image = toImage
        }, completion: nil)
        
        // 根据showEffects的赋值情况来显示或者隐藏雪花发射器
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.snowView.alpha = showEffects ? 1.0 : 0.0
        }, completion: nil)
    }
    
    /// 切换航班号和出站口数据，并且执行立方体动画
    ///
    /// - Parameters:
    ///   - label: 用于展示航班号或者出站口
    ///   - text: 航班号或者出站口信息
    ///   - direction: 立方体动画执行的方向
    func cubeTransition(label: UILabel, text: String, direction: AnimationDirection) {
        
        // 创建辅助的label，并且设置它的各种属性
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        auxLabel.backgroundColor = label.backgroundColor

        // 就算翻滚的偏移量
        let auxLabelOffset = CGFloat(direction.rawValue) * label.frame.size.height / 2.0

        // 对辅助的label在x和y轴上执行相应的缩放
        auxLabel.transform = CGAffineTransform(translationX: 0.0, y: auxLabelOffset)
            .scaledBy(x: 1.0, y: 0.1)
        
        // 将辅助的label添加到label的父控件上面
        label.superview?.addSubview(auxLabel)
        
        // 添加cube动画
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            
            auxLabel.transform = .identity
            label.transform = CGAffineTransform(translationX: 0.0, y: -auxLabelOffset)
                .scaledBy(x: 1.0, y: 0.1)
            
        }, completion: { _ in
            label.text = auxLabel.text
            label.transform = .identity

            // 动画执行完成之后，将辅助的label移除
            auxLabel.removeFromSuperview()
        })
    }
    
    /// 给起飞地和目的地label添加动画
    ///
    /// - Parameters:
    ///   - label: 用于显示起飞地或者目的地数据的label
    ///   - text: 起飞地或者目的地数据
    ///   - offset: 动画执行时的偏移量
    func moveLabel(label: UILabel, text: String, offset: CGPoint) {
        
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        auxLabel.backgroundColor = .clear
        
        auxLabel.transform = CGAffineTransform(translationX: offset.x, y: offset.y)
        auxLabel.alpha = 0
        view.addSubview(auxLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            label.transform = CGAffineTransform(translationX: offset.x, y: offset.y)
            label.alpha = 0.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseIn, animations: {
            auxLabel.transform = .identity
            auxLabel.alpha = 1.0
        }, completion: {_ in
            
            auxLabel.removeFromSuperview()
            label.text = text
            label.alpha = 1.0
            label.transform = .identity
        })
    }
    
}
