//
//  QypCAKeyframeAnimation2.swift
//  CoreAnimation
//
//  Created by Apple on 2017/10/13.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class QypCAKeyframeAnimation2: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "122")
        let keyFrameAnimation = CAKeyframeAnimation()
        keyFrameAnimation.duration = 2
        keyFrameAnimation.autoreverses = true
        keyFrameAnimation.repeatCount = MAXFLOAT


        ///注意贝塞尔取曲线啊....
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 300, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 90))

        keyFrameAnimation.keyPath = "position"

        keyFrameAnimation.path = path.cgPath

        self.layer.add(keyFrameAnimation, forKey: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
