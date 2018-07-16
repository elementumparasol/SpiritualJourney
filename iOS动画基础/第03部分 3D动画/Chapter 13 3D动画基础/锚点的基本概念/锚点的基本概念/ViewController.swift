//
//  ViewController.swift
//  锚点的基本概念
//
//  Created by Enrica on 2018/7/16.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// blueLayer
    private lazy var blueLayer: CALayer = {
        
        let blueLayer = CALayer()
        blueLayer.bounds = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        blueLayer.backgroundColor = UIColor.blue.cgColor
        return blueLayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layer的锚点默认为(0.5, 0.5)，并且CALayer的position和anchorPoint始终是
        // 重合的，因此，尽管我们创建了一个宽、高都为200的蓝色layer，但是程序运行之后，我们
        // 只能看到一半。原因就是: position是以父layer的左上角(0， 0)为原点的，而锚点决定
        // 了blueLayer的位置，而blueLayer默认的anchorPoint值为(0.5, 0.5)，因此我们
        // 只能看到一半的蓝色layer
        view.layer.addSublayer(blueLayer)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // CALayer有两个非常重要的属性——position和anchorPoint。position是用来设置CALayer在父层
        // 中的位置的，并且position是以父层左上角为坐标原点的。anchorPoint被称为定位点(或者锚点)，它
        // 决定着CALayer身上的哪个点会在position属性所指的位置上，并且anchorPoint是以自己左上角为坐
        // 标原点的，它的x和y的取值范围是从0到1，并且默认值都是0.5。另外，CALayer的anchorPoint和它的
        // position始终是重合的
        UIView.animate(withDuration: 3, animations: {
            
            // 修改blueLayer的锚点为(0, 0)
            self.blueLayer.anchorPoint = CGPoint.zero
        })
        
        // 注意，要更改blueLayer的位置，除了修改锚点之外，其实还可以修改position的位置
    }
    
    @IBAction func changePosition(_ sender: Any) {
        
        // 因为anchorPoint和position是重合的，因此，只要是position
        // 修改了，那么anchorPoint会相对变动
        self.blueLayer.position = CGPoint(x: 100, y: 100)
    }
    
}

