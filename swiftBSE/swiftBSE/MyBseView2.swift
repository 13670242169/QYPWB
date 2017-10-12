//
//  MyBseView2.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//
/*
 2: 二阶曲线

 二阶曲线，是指有一个公共切点(不知道怎么形容)曲线
 网上扣了一张图，B这个点，就是所谓的公共切点

 这里的公共切点，就是右上角那个点啦。300,0
 */
import UIKit

class MyBseView2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        // 设置线填充色
        UIColor.red.setStroke()

        // 新建一个bezier对象
        let bezierPath = UIBezierPath()

        //设置线宽
        bezierPath.lineWidth = 10

        // 设置线两头样式
        bezierPath.lineCapStyle = .round
        


        // 设置起吊和终点
        bezierPath.move(to: CGPoint(x: 100, y: 100))
        bezierPath.addQuadCurve(to: CGPoint(x:200,y:200), controlPoint: CGPoint(x: 300, y: 0))
        bezierPath.stroke()


    }

}
