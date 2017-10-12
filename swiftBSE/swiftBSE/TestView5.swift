//
//  TestView5.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//  内切圆

import UIKit

class TestView5: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        // 设置填充颜色
        UIColor.red.setStroke()
        // 新建一个bezier对象,此对象用于绘制内切圆,需要传入回执内切圆的矩形frame///根据一个Rect画一个椭圆曲线  Rect为正方形时画的是一个圆
        let bezierPath :UIBezierPath = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 180, height: 280))

        //设置线宽
        bezierPath.lineWidth = 10
        // 设置线两头样式
        bezierPath.lineCapStyle = .round
        //开始绘制
        bezierPath.stroke()
    }

}
