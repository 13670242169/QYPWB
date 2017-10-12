//
//  TestView3.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class TestView3: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        ///设置线的填充色
        UIColor.red.setStroke()

         // 新建一个bezier对象，此对象用于绘制一个圆角矩形//当Rect为正方形时且Radius等于边长一半时画的是一个圆
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: 280, height: 280), cornerRadius: 30)

        ///设置线宽
        bezierPath.lineWidth = 1

        /// 设置线两头样式
        bezierPath.lineCapStyle = .butt

        /// 开始绘制
        bezierPath.stroke()

    }

}
