//
//  AppDelegate.swift
//  TableViewDemo
//
//  Created by DragonLi on 2017/8/22.
//  Copyright © 2017年 im.juejin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let VC = ViewController()
        let nav = UINavigationController(rootViewController: VC)
        window?.rootViewController = nav
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}

