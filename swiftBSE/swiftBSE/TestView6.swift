//
//  TestView6.swift
//  swiftBSE
//
//  Created by 高级iOS开发 on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
画多边形
 
 */
import UIKit

class TestView6: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        //设置线的填充颜色
        UIColor.red.setStroke()
        let bezierPath = UIBezierPath()
        bezierPath.lineWidth = 10
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
        bezierPath.move(to: CGPoint(x: 100.0, y: 0.0))
        bezierPath.addLine(to: CGPoint(x: 160, y: 140))
        bezierPath.addLine(to: CGPoint(x: 40, y: 160))
        bezierPath.addLine(to: CGPoint(x: 0, y: 40))
        //第五条线使用这个方法实现
        bezierPath.close()
        bezierPath.stroke()
    }
   

}
