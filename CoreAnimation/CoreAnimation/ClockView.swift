//
//  ClockView.swift
//  CoreAnimation
//
//  Created by Apple on 2017/10/13.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ClockView: UIImageView {

    /// 当前的秒钟
    var secondLayer:CALayer?
    /// 当前的分钟
    var minuteLayer:CALayer?
    /// 当前的时针
    var hourLayer:CALayer?

    /// 度数
    let perSecondAngle:CGFloat = 6
    let perMinuteAngle:CGFloat = 6
    let PerHourAngle:CGFloat = 30

    ///每一分钟,时针选择的度数
    let perMinteWithHourRotateAngle:CGFloat = 0.5

    override init(frame: CGRect) {
        super.init(frame: frame)

        setSecondLayer()
        setMinuteLayer()
        setHourLayer()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeChange), userInfo: nil, repeats: true)
        timeChange()
    }

    @objc func timeChange(){
        let calendar = NSCalendar.current
        let dateComponents = calendar.dateComponents([.second,.minute,.hour], from: Date())

        //获取但钱是多少秒
        let currentSecond = dateComponents.second! + 1
        //秒钟开始选择
        // 计算秒钟但钱旋转的角度
        //angle = 当前多少秒 * 每一秒旋转的角度
        let secondAngle = CGFloat(currentSecond) * perSecondAngle
        self.secondLayer?.transform = CATransform3DMakeRotation(secondAngle / 180 * .pi, 0, 0, 1)

        /// 获取当前多少分钟
        let currentMinute = dateComponents.minute

        // 分钟开始旋转
        // 计算秒钟当前旋转的角度
        // angle = 当前多少分 * 每分钟旋转的角度
        let minuteAngle = CGFloat(currentMinute!) * perMinuteAngle
        self.minuteLayer?.transform = CATransform3DMakeRotation(minuteAngle / 180 * .pi, 0, 0, 1)

        ///获取但钱是多少小时
        let currentHour = dateComponents.hour

        // 分钟开始旋转
        /// 计算秒钟当前旋转的角度
        /// angle = 当前多少小时 * 每小时旋转的角度
        let hourAngle:CFloat = CFloat(CGFloat(currentHour!) * PerHourAngle + CGFloat(currentMinute!) * perMinteWithHourRotateAngle)
        self.hourLayer?.transform = CATransform3DMakeRotation(CGFloat(hourAngle / 180 * .pi), 0, 0, 1)
    }

    func setSecondLayer(){
        let secondLayer = CALayer()
        secondLayer.bounds = CGRect(x: 0, y: 0, width: 1, height: 80)
        secondLayer.backgroundColor = UIColor.red.cgColor
        secondLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLayer.position = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        self.layer.addSublayer(secondLayer)
        self.secondLayer = secondLayer
    }
    func setMinuteLayer(){
        let minuteLayer = CALayer()
        minuteLayer.bounds = CGRect(x: 0, y: 0, width: 2, height: 70)
        minuteLayer.backgroundColor = UIColor.black.cgColor
        minuteLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLayer.position = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        self.layer.addSublayer(minuteLayer)
        self.minuteLayer = minuteLayer
    }
    func setHourLayer(){
        let hourLayer = CALayer()
        hourLayer.bounds = CGRect(x: 0, y: 0, width: 3, height: 50)
        hourLayer.backgroundColor = UIColor.black.cgColor
        hourLayer.cornerRadius = 1.5
        hourLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        hourLayer.position = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        self.layer.addSublayer(hourLayer)
        self.hourLayer = hourLayer
    }



    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
