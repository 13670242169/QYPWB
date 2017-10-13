//
//  QypCABasicAnimation.swift
//  CoreAnimation
//
//  Created by Apple on 2017/10/13.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class QypCABasicAnimation: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "122")

        //1.创建动画对象
        let basicAnimation = CABasicAnimation()

        //2.设置动画属性值
        basicAnimation.keyPath = "transform.scale"
        basicAnimation.toValue = 0

        //3.设置动画执行次数
        basicAnimation.repeatCount = MAXFLOAT

        //4.设置动画执行的长度
        basicAnimation.duration = 1

        //5自动翻转(怎么来怎么去)
        basicAnimation.autoreverses = true

        self.layer.add(basicAnimation, forKey: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
