//
//  LFLCustomView.swift
//  CustomeDemo(delegate&&Closure)
//
//  Created by DragonLi on 2017/8/28.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//


import UIKit

protocol CustomViewtTapButtonDelegate:class {
    
    func buttonClickAction()

}

class LFLCustomView: UIView {
    
    var titleLabel = UILabel()
    
    var bottomButton = UIButton(type: .custom)
    
    var tapButtonClosure : ((String) ->() )?

    weak var delegate: CustomViewtTapButtonDelegate?
    
    convenience init(labelTitle:String,Buttontitle:String,frame:CGRect) {
        self.init(frame: frame)
        self.backgroundColor = .white
        settingUI(labelTitle: labelTitle, Buttontitle: Buttontitle)
    }
    
    func settingUI(labelTitle:String,Buttontitle:String)  {
        titleLabel.text = labelTitle
        titleLabel.textColor = UIColor.red
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 28)
        self.addSubview(titleLabel)
        
        bottomButton .setTitle(Buttontitle, for: .normal)
        bottomButton .setTitleColor(.brown, for: .normal)
        bottomButton.frame = CGRect(x: 85, y: titleLabel.frame.origin.y +  titleLabel.frame.size.height + 20, width: UIScreen.main.bounds.width - 85 * 2.0, height: 30)
        bottomButton.addTarget(self, action: #selector(tapButtonHandle), for: .touchUpInside)
        
        self.addSubview(bottomButton)
    }
}

// MARK: - handle UI Actions
extension LFLCustomView{
    
    @objc fileprivate func tapButtonHandle()  {
        print("frist part of closure\(#function)")
        if self.tapButtonClosure != nil {
            self.tapButtonClosure?(self.bottomButton.currentTitle!)
        }
        // optional
        self.delegate?.buttonClickAction()
        
        
    }
}

