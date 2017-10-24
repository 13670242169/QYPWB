//
//  ViewController.swift
//  TextKit
//
//  Created by 高级iOS开发 on 2017/10/24.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: QYPLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "轻点:http://www.baidu.com"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

