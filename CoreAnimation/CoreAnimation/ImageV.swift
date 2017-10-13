//
//  ImageV.swift
//  CoreAnimation
//
//  Created by 高级iOS开发 on 2017/10/12.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ImageV: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "122")
        //设置阴影的颜色
        self.layer.shadowColor = UIColor.orange.cgColor
        //设置阴影的不透明度
        self.layer.shadowOpacity = 1
        //设置阴影的偏移量
        self.layer.shadowOffset = CGSize(width: 30, height: 30)
        //设置阴影的模糊半径
        self.layer.shadowRadius = 10
        
        //边框宽度。忘4里面走
        self.layer.borderWidth = 10
        // 设置边框的颜色
        self.layer.borderColor = UIColor.brown.cgColor
        //注意：：：：UIimageView的layer使用有限不一样。在设置圆角的时候需要注意：：
        //设置圆角
        self.layer.cornerRadius = 50
        //原因是calayer层中，有一个专门存放图片的层contents
        self.layer.masksToBounds = true
        //方法一
        UIView.animate(withDuration: 0.5) {
            
            self.layer.transform = CATransform3DMakeRotation(.pi, 1, 1, 0)
            //把结构体缓存对象
            _ = NSValue(caTransform3D: CATransform3DMakeRotation(.pi, 1, 1, 0))

            //方法二
//            self.layer.setValue(M_PI, forKey: "transform.rotation.x")
        }

//        // 我们一般通过KVC做快速旋转。平移，缩放
//        let anim = CABasicAnimation(keyPath: "transform.rotation.x")
//        anim.toValue = 1 * M_PI
//        anim.duration = 1
//        anim.repeatCount = MAXFLOAT
//        anim.isRemovedOnCompletion = true
//        self.layer.add(anim, forKey: nil)
//        self.layer.removeAllAnimations()
//        UIView.animate(withDuration: 0.2) {
//            self.transform = self.transform.rotated(by: CGFloat(M_PI))
//        }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
