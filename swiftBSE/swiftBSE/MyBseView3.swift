//
//  MyBseView3.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//
/*
 3: 三阶曲线

 三阶曲线，与二阶曲线类似，系统都有提供内置的方法，只是多了一个公共切点而已。
 */
import UIKit

class MyBseView3: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        //设置线的填充色
        UIColor.red.setStroke()

        //新建一个bezier对象
        let bezierPath = UIBezierPath()

        //设置线的宽度
        bezierPath.lineWidth = 10
        // 设置线的两头样式
        bezierPath.lineCapStyle = .round
        // 设置链接类型
        bezierPath.lineJoinStyle = .miter
        // 设置起点,终点坐标
        bezierPath.move(to: CGPoint(x: 100, y: 100))
        bezierPath.addCurve(to: CGPoint(x:200,y:200), controlPoint1: CGPoint(x:150,y:0), controlPoint2: CGPoint(x: 150, y: 300))

        // 开始绘制
        bezierPath.stroke()


    }
    

}
