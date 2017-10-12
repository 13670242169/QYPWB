//
//  ColorV.swift
//  CoreAnimation
//
//  Created by 高级iOS开发 on 2017/10/12.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ColorV: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.orange
        
        //设置阴影颜色
        self.layer.shadowColor = UIColor.black.cgColor
        // 设置阴影的不透明度
        self.layer.shadowOpacity = 1
        // 设置阴影的偏移量
        self.layer.shadowOffset = CGSize(width: 20, height: 20)
        //设置阴影的模糊半径
        self.layer.shadowRadius = 10
        // 设置边框的宽度。往里面走的
        self.layer.borderWidth = 10
        // 设置边框的颜色
        self.layer.borderColor = UIColor.brown.cgColor
        // 设置圆角半径
        self.layer.cornerRadius = 30
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
