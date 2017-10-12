//
//  ViewController.swift
//  CoreAnimation
//
//  Created by 高级iOS开发 on 2017/10/12.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        test2()
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


}

