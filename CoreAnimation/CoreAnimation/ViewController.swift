//
//  ViewController.swift
//  CoreAnimation
//
//  Created by 高级iOS开发 on 2017/10/12.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//


//http://www.jianshu.com/p/42cdd0a184a9
import UIKit

class ViewController: UIViewController {
    var LayerTransition: QypCATransition?
    static var a = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white


        /*
        //获取当前时间
        let startTime = NSDate()

//       //当前时间的时间戳
        let timeInterval:TimeInterval = startTime.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        print("当前时间的时间戳：\(timeStamp)")

        guard let image = UIImage(named: "122") else {
            return
        }
        let queue = DispatchQueue(label: "qqq", qos: DispatchQoS.userInitiated, attributes: DispatchQueue.Attributes.concurrent)
        queue.async {
            let current = Thread.current
            print(current)
            _ = UIImageJPEGRepresentation(image, 0.5)
        }
        let endTime = NSDate()
        //当前时间
        let timeInterval1:TimeInterval = endTime.timeIntervalSince1970
        let timeStamp1 = Int(timeInterval1)
        print("当前时间的时间戳：\(timeStamp1)")
        */

        /*
        -----------test8()
        let LayerTransition = QypCATransition(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        LayerTransition.center = self.view.center
        self.view.addSubview(LayerTransition)
        self.LayerTransition = LayerTransition
        */
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        test8()
//        test2()
    }
    func test1(){
        let colorV = ColorV(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        colorV.center = self.view.center
        self.view.addSubview(colorV)
    }
    func test2(){
       let imag = ImageV(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
       imag.center = self.view.center
       self.view.addSubview(imag)
    }
    func test3(){
        let Layer = LayerImage(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        Layer.center = self.view.center
        self.view.addSubview(Layer)
    }
    func test4(){
        let Layer = ClockView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        Layer.center = self.view.center
        self.view.addSubview(Layer)
    }
    func test5(){
        let Layer = QypCABasicAnimation(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        Layer.center = self.view.center
        self.view.addSubview(Layer)
        
    }
    func test6(){
        let Layer = QypCAKeyframeAnimation(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        Layer.center = self.view.center
        self.view.addSubview(Layer)

    }
    func test7(){
        let Layer = QypCAKeyframeAnimation2(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        Layer.center = self.view.center
        self.view.addSubview(Layer)
    }
    func test8(){
        ViewController.a += 1
        if ViewController.a == 4{
            ViewController.a = 0
        }
        let iamgeName = "\(ViewController.a)"
        self.LayerTransition?.image = UIImage(named:iamgeName)

        // 转场动画
        // 添加动画
        let transitionAnimation = CATransition()


        //设置转场
        transitionAnimation.type = "rippleEffect"
        //设置动画起始位置
        transitionAnimation.startProgress = 0.3
        //设置动画结束为止
        transitionAnimation.endProgress = 0.5

        transitionAnimation.duration = 1

        self.LayerTransition?.layer.add(transitionAnimation, forKey: nil)
    }
    func test9(){
        let Layer = QYpCAAnimationGroup(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        Layer.center = self.view.center
        self.view.addSubview(Layer)
    }
}

