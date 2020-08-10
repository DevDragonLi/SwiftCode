//
//  ViewController.swift
//  CustomeDemo(delegate&&Closure)
//
//  Created by DragonLi on 2017/8/28.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CustomeDemo"
        customViewDemo()
    }
    
    func customViewDemo()  {
        let customView = LFLCustomView(labelTitle:"广州恒大", Buttontitle: "click -鸟细砂岩", frame:  CGRect(x: 0, y: 100, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.32))
        customView.tapButtonClosure = {
           // Closure handle action
            print("second part of closure\($0)")
           print("(last part of closure)VC get tap action")
        }
    
        customView.delegate = self
 
        view.addSubview(customView)
    }
}

extension ViewController:CustomViewTapButtonDelegate {
    
    func buttonClickAction()  {
        print("VC get tap action with delegate")
    }
}



