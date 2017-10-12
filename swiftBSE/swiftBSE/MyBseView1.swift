//
//  MyBseView1.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class MyBseView1: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        // 设置线的填充颜色
        UIColor.red.setStroke()

        // 新建一个bezier对象
        let bezierPath = UIBezierPath()

        // 设置线宽度
        bezierPath.lineWidth = 10

        // 设置线两头样式
        bezierPath.lineCapStyle = .round

        // 设置七点,终点
        bezierPath.move(to: CGPoint(x: 10, y: 10))
        bezierPath.addLine(to: CGPoint(x: 100, y: 100))

        //开始绘图
        bezierPath.stroke()

    }

}
