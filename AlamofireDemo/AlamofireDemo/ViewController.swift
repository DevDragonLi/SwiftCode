//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by DragonLi on 2017/8/29.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = RequestTool()
        request.loadListDemoDatas { (object) in
            print(object)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

