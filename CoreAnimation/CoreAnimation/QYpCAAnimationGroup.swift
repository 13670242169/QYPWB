//
//  QYpCAAnimationGroup.swift
//  CoreAnimation
//
//  Created by Apple on 2017/10/13.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class QYpCAAnimationGroup: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red

        let basicAnimation01 = CABasicAnimation()
        basicAnimation01.keyPath = "position.y"
        basicAnimation01.toValue = 300

        let basicAnimation02 = CABasicAnimation()
        basicAnimation02.keyPath = "transform.scale"
        basicAnimation02.toValue = 0.5

        let animationGrop = CAAnimationGroup()

        //会自动执行animations数组中的所有动画对象
        animationGrop.animations = [basicAnimation01,basicAnimation02]

        animationGrop.isRemovedOnCompletion = false

        animationGrop.fillMode = kCAFillModeForwards

        self.layer.add(animationGrop, forKey: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
