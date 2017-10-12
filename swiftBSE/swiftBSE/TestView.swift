//
//  TestView.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//   贝塞尔曲线之模蚂蚁信用
import UIKit
class TestView: UIView {
    var bezierPath:UIBezierPath?
    var sideShapeLayer:CAShapeLayer?
    var centerPoint:CGPoint?
    static let totalProgress:CGFloat = 100.0
    lazy var redView: UIView = {
        let redview = UIView(frame: CGRect(x: self.center.x - 105, y: self.center.y - 5, width: 5, height: 5))
        redview.backgroundColor = UIColor.red
        return redview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TestView{
    func setupUI(){
        centerPoint = self.center
        
        let bezierPath = UIBezierPath(arcCenter: centerPoint!, radius: 100, startAngle: .pi, endAngle: .pi * 2, clockwise: true)
        self.bezierPath = bezierPath
        let sideShapeLayer = CAShapeLayer()
        sideShapeLayer.strokeColor = UIColor.black.cgColor
        sideShapeLayer.fillColor = nil
        sideShapeLayer.lineWidth = 2
        sideShapeLayer.path = bezierPath.cgPath
        self.layer.addSublayer(sideShapeLayer)
        self.sideShapeLayer = sideShapeLayer
        self.addSubview(redView)
    }
    func bindDataWithProgress(progress:CGFloat){
        let percent = progress / TestView.totalProgress
        let angle:CGFloat = .pi + .pi * percent
        let redPath:UIBezierPath = UIBezierPath(arcCenter: centerPoint!, radius: 100, startAngle: .pi, endAngle: angle, clockwise: true)
        startAnimationWithLayer(layer: self.redView.layer, path: redPath.cgPath, duration: 3.0, rotationMode: kCAAnimationLinear)
    }
    func startAnimationWithLayer(layer:CALayer,path:CGPath,duration:CGFloat,rotationMode:String){
        let animate = CAKeyframeAnimation(keyPath: "position")
        animate.path = path
        animate.duration = CFTimeInterval(duration)
        animate.isRemovedOnCompletion = false
        animate.fillMode = kCAFillModeForwards
        animate.rotationMode = rotationMode
        let linearTim:CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animate.timingFunctions = [linearTim]
        layer.add(animate, forKey: nil)
    }
}
