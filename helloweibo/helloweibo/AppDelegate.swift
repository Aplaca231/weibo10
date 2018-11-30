//
//  AppDelegate.swift
//  helloweibo
//
//  Created by Mac on 2018/11/29.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white   //可选项
        
        window?.rootViewController = ViewController()
        
        window?.makeKeyAndVisible()
        return true
    }

  

}

