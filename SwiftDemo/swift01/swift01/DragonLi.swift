//
//  DragonLi.swift
//  swift01
//
//  Created by DragonLi on 2016/12/12.
//  Copyright © 2016年 DragonLi. All rights reserved.
//

import UIKit

class DragonLi: NSObject {
    
    var name :String?
    var age  :Int = 25
    
    // 运行时获取当前属性 
    class func propertylist() {
     
        var count :UInt32 = 0  // outCount: UnsafeMutablePointer<UInt32>!
        let list = class_copyPropertyList(self, &count)
        print("属性数量 \(count)")
        
// :使用guard 优化代码
        for i in 0..<Int(count){
            
            guard let property = list?[i],
            let charName = property_getName(property),
            let strPro = String(utf8String: charName)
            else {
              continue
            }
        // 说明存在strPro
            print(strPro)
        }
//        for i in 0..<Int(count){
//        // 对于下表属性
//            let property = list?[i]
//            let charName = property_getName(property!)
//            print(charName ?? "nil")
//            let strPro = String(utf8String: charName!)
//            print(strPro ?? "nil")
//            }
        
       free(list)
    }
}
