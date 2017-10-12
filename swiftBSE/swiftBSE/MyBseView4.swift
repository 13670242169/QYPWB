//
//  MyBseView4.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//
/*
 系统最多只给出了三阶曲线的绘制方法，这时有的人就要说了，产品要做一个4阶、5阶的曲线，怎么搞？
 查一下API，你会发现一个appendPath的方法，不用说，看名字就知道什么意思了吧。
 */

import UIKit

class MyBseView4: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        /// 设置线填充颜色
        UIColor.red.setStroke()

        /// 新建一个bezier对象
        let bezierPath = UIBezierPath()

        ///设置线宽
        bezierPath.lineWidth = 10
        // 设置线两头样式
        bezierPath.lineCapStyle = .round

        // 设置起点和终点
        bezierPath.move(to: CGPoint(x: 100, y: 100))
        bezierPath.addCurve(to: CGPoint(x: 200, y: 200),
                            controlPoint1: CGPoint(x: 150, y: 0),
                            controlPoint2: CGPoint(x: 150, y: 300))

        // 创建第二条贝塞尔线
        let bezierPath2 = UIBezierPath()
        //设置起点,终点坐标
        bezierPath2.move(to: CGPoint(x: 200, y: 200))
        bezierPath2.addCurve(to: CGPoint(x: 290, y: 290), controlPoint1: CGPoint(x: 250, y: 0), controlPoint2: CGPoint(x: 250, y: 300))

        //将第二条线,加到第一条线上面去
        bezierPath.append(bezierPath2)

        // 开始绘制
        bezierPath.stroke()

    }

}
