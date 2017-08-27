//
//  LFLBlockVC.swift
//  TableViewDemo
//
//  Created by DragonLi on 2017/8/27.
//  Copyright © 2017年 im.juejin. All rights reserved.
//

import UIKit

/// OC :Block  Swift :clourse
class LFLBlockVC: UIViewController {
   
    var stringBlock :((String) ->())?
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
           self.async_method(complte: { (stringValue) in
               print(stringValue)
            print("fresh_UI")
            })
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true) {
            if self.stringBlock != nil{
             self.stringBlock?("this is callBack String")
        }
    }
}

    func async_method(complte:(String) ->() ) -> () {
        complte("complete handle task")
    }
   
}


