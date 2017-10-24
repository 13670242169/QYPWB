//
//  ViewController.swift
//  try的使用
//
//  Created by 高级iOS开发 on 2017/10/24.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "{\"name\":\"nimei\"}"
        guard let data = str.data(using: .utf8) else {
            return
        }
        // 1.try? -如果转换失败,大多数会返回nil
        // 推荐使用
//        let json  = try? JSONSerialization.jsonObject(with: data, options: [])// 反序列化
//        print(json)
        // 2.try! -如果失败,直接奔溃! 尽量避免
//        let json  = try! JSONSerialization.jsonObject(with: data, options: [])// 反序列化
//        print(json)
        
        //3.do try 最安全,但是很麻烦,另外,智能提示很不友好
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        } catch {
            // 输出代码的详细错误信息
            print(error)
        }
        
        
    }


}

