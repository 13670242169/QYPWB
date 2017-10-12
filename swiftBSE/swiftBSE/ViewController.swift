//
//  ViewController.swift
//  swiftBSE
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test5_1()
    }
    /// 蚂蚁信用分
    func test1(){
        let testView = TestView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
        testView.bindDataWithProgress(progress: 60)
    }
    func test2(){
        let testView2 = TestView2(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView2.center = self.view.center
        self.view.addSubview(testView2)
    }
    func test3(){
        let testView = TestView3(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test4(){
        let testView = TestView4(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test5(){
        let testView = TestView5(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test5_1(){
        let testView = TestView6(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test6(){
        let testView = MyBseView1(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test7(){
        let testView = MyBseView2(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test8(){
        let testView = MyBseView3(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    func test9(){
        let testView = MyBseView4(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView.center = self.view.center
        self.view.addSubview(testView)
    }



}

