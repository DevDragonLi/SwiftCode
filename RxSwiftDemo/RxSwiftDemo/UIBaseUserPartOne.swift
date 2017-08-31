//
//  UIBaseUserPartOne.swift
//  RxSwiftDemo
//
//  Created by DragonLi on 2017/8/31.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class UIBaseUserPartOne: UIViewController{
    
    lazy var bag:DisposeBag = {
        return DisposeBag()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonDemo()
    }
}

// MARK: - base one
extension  UIBaseUserPartOne {
    fileprivate  func buttonDemo()  {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        btn.center = view.center
        btn.setTitle("clickButton", for: .normal)
        btn.setTitleColor(UIColor.brown, for: .normal)
        view.addSubview(btn)
        
        btn.rx.tap.subscribe(onNext: { () in
            print("click Button")
        }, onError: { (error) in
        }, onCompleted: {
        }).addDisposableTo(bag)
    }
}


