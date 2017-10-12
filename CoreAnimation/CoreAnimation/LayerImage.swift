//
//  LayerImage.swift
//  CoreAnimation
//
//  Created by 高级iOS开发 on 2017/10/12.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class LayerImage: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let layer = CALayer()
        layer.backgroundColor = UIColor.brown.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.layer.addSublayer(layer)
        layer.contents = UIImage(named: "122")?.cgImage
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
