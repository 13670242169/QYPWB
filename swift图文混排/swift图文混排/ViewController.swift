//
//  ViewController.swift
//  swift图文混排
//
//  Created by 高级iOS开发 on 2017/10/22.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1 图片附件
        let attachment = NSTextAttachment()
        
        attachment.image = UIImage(named: "compose_emoticonbutton_background_highlighted")
        
        let height = label.font.lineHeight
        attachment.bounds = CGRect(x: 0, y: 0, width: height, height: height)
        
        // 1属性文本
        let imageStr = NSAttributedString(attachment: attachment)
        
        // 2可变的图文字符串
        let attrStrM = NSMutableAttributedString(string: "我")
        attrStrM.append(imageStr)
        let aaaa = NSAttributedString(string: "哈哈")
        attrStrM.append(aaaa)
        
        //3 设置label
        label.attributedText = attrStrM
    }


}

