//
//  UILabelHelper.swift
//  swift01
//
//  Created by DragonLi on 2016/12/12.
//  Copyright © 2016年 DragonLi. All rights reserved.
//          便利构造器  
import UIKit

/// --OC的分类类似
extension UILabel {
    
    convenience init(fontSize:CGFloat ,frame:CGRect ) {
    
        self.init(frame:frame)
        
        self.font = UIFont.systemFont(ofSize: fontSize)
        
    }
}


