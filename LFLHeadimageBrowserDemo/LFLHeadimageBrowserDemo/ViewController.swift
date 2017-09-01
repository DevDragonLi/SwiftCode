//
//  ViewController.swift
//  LFLHeadimageBrowserDemo
//
//  Created by DragonLi on 2017/9/1.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        headImageView.handleTapBrower()
    }
}

