//
//  ViewController.swift
//  表情包数据
//
//  Created by 高级iOS开发 on 2017/10/23.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let string = "我[爱你]啊！！ [笑哈哈],我想[泪]了，[马上有对象]是骗人的，这是马上面有对象[哼]"
        testlabel.attributedText = YWEmoticonManager.shared.emoticonString(string: string, font: testlabel.font)
        
    }



}

