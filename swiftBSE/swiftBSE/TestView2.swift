//
//  TestView2.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//  贝塞尔曲线

import UIKit

class TestView2: UIView {

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

        ///新建一个bezier对象,此对象用于回执矩形,需要传入回执的矩形的frame
        let bezierPath = UIBezierPath(rect: CGRect(x: 20, y: 10, width: 280, height: 280))

        //设置填充颜色
        UIColor.red.set()
        bezierPath.fill()

        ///设置线宽
        bezierPath.lineWidth = 1

        /// 设置线两头样式
        bezierPath.lineCapStyle = .butt

        /// 开始绘制
        bezierPath.stroke()

    }

}
