//
//  QypCAKeyframeAnimation.swift
//  CoreAnimation
//
//  Created by Apple on 2017/10/13.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class QypCAKeyframeAnimation: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.image = UIImage(named: "122")

        ///1. 创建动画
        let keyFrameAnimation = CAKeyframeAnimation()

        //2.设置动画属性值
        keyFrameAnimation.keyPath = "transform.rotation"
        keyFrameAnimation.values = [-5 / 180 * M_PI, 5 / 180 * M_PI, -5 / 180 * M_PI]
        keyFrameAnimation.repeatCount = MAXFLOAT
        keyFrameAnimation.duration = 0.2

        self.layer.add(keyFrameAnimation, forKey: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
