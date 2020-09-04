//
//  UIImage+HandleTool.swift
//  TableViewDemo
//
//  Created by DragonLi on 2017/8/28.
//  Copyright © 2017年 im.juejin. All rights reserved.
//                    handle tool
/*
 Color Blended Layers:red color should option
 Color Misaligned Images: yellow:color should option (hightlighting scale or resize)
 Color Offscreen-Rendered;iOS9+ ,apple option it works well
 */
import UIKit

extension UIImage {
    
    /// handle scale/ resize size image
    ///
    /// - Parameters:
    ///   - named:originImageName
    ///   - size: targetImagesize
    ///   - cornerRadius: cornerRadius
    ///   - backColor: backColor
    ///   - lineColor: lineColor
    /// - Returns: handle image
  class  func initImage(named name: String,size:CGSize, cornerRadius:Bool = true,backColor: UIColor = UIColor.white, lineColor: UIColor = UIColor.lightGray) -> UIImage? {
        let rect = CGRect(origin: CGPoint(), size: size)
    
        guard let iamgeValue =  UIImage(named: name) else { return nil }
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        if cornerRadius == true {
            backColor.setFill()
            UIRectFill(rect)
            let path = UIBezierPath(ovalIn: rect)
            path.addClip()
            iamgeValue.draw(in: rect)
            UIColor.darkGray.setStroke()
            path.lineWidth = 1.0      // default value 1.0
            path.stroke()
        }else{
            iamgeValue.draw(in: rect)
        }
        let resultTarget = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultTarget   // 60 * 50 
    }
    
}


