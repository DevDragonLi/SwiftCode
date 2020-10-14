//
//  UIImageView+handleTapBrower.swift
//  LFLHeadimageBrowserDemo
//
//  Created by DragonLi on 2017/9/1.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import UIKit
import Photos

private let SHOWANIMATEDURATION = 0.25

private var originFrame:CGRect = CGRect()


extension UIImageView {
    
    open func handleTapBrower()  {
        if !self.isUserInteractionEnabled {
            self.isUserInteractionEnabled = true
        }
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAction)))
    }
    
    @objc fileprivate func saveCurrentImageClick()  {
        // 权限校验
        // 成功判别
        try? PHPhotoLibrary.shared().performChangesAndWait {
            PHAssetChangeRequest.creationRequestForAsset(from: self.image ?? UIImage.init())
        }
    }
    
    @objc fileprivate func dismissAction(tap:UITapGestureRecognizer)  {
        let backgroundView = tap.view
        UIView.animate(withDuration: SHOWANIMATEDURATION, animations: {
            backgroundView?.viewWithTag(1024)?.frame = originFrame
        }) { (complete) in
            backgroundView?.removeFromSuperview()
        }
    }
    @objc fileprivate  func handleTapAction()  {
        
        let window = UIApplication.shared.keyWindow
        
        let backgroundView = UIView(frame:UIScreen.main.bounds)
        
        backgroundView.backgroundColor = UIColor.clear
        
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissAction(tap:))))
        originFrame = self.convert(self.bounds, to: window)
        
        let showImageView  = UIImageView(frame: originFrame)
        showImageView.tag = 1024
        showImageView.image = self.image
        showImageView.contentMode = .scaleAspectFit
        
        let saveButton = UIButton(type: .custom)
        saveButton.frame = CGRect(x: UIScreen.main.bounds.width / 2.0 - 25, y: UIScreen.main.bounds.height - 60, width: 50, height: 25)
        saveButton.setTitle("保存", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        saveButton.layer.cornerRadius = 5
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        saveButton.clipsToBounds = true
        saveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(saveCurrentImageClick)))
        
        window?.addSubview(backgroundView)
        backgroundView.addSubview(showImageView)
        backgroundView.addSubview(saveButton)
        
        UIView.animate(withDuration: SHOWANIMATEDURATION) {
            var width:CGFloat = 0.0
            var height:CGFloat = 0.0
            height = UIScreen.main.bounds.height - self.image!.size.height * (UIScreen.main.bounds.width - 28 / self.image!.size.width)
            width = UIScreen.main.bounds.width;
            showImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
            showImageView.center = showImageView.superview!.center
            originFrame = showImageView.frame
        }
    }
}

