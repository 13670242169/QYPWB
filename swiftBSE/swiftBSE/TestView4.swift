//
//  TestView4.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class TestView4: UIView {

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

        // 新建一个bezier对象，此对象用于绘制一个部分圆角的矩形，左上、右下
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: 280, height: 280), byRoundingCorners:.topLeft , cornerRadii: CGSize(width: 10, height: 10))

        ///设置线宽
        bezierPath.lineWidth = 1

        /// 设置线两头样式
        bezierPath.lineCapStyle = .butt

        /// 开始绘制
        bezierPath.stroke()

    }

}
