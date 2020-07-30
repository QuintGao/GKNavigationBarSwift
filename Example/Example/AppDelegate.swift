//
//  AppDelegate.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/3/24.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GKConfigure.awake()
        
        GKConfigure.setupCustom { (configure) in
            configure.gk_translationX = 15
            configure.gk_translationY = 20
            configure.gk_scaleX = 0.90
            configure.gk_scaleY = 0.92
            configure.gk_navItemLeftSpace = 12.0
            configure.gk_navItemRightSpace = 12.0
            
            configure.shiledItemSpaceVCs = [UIViewController.classForCoder(), "GKMainViewController"]
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        
        
        let nav = UINavigationController(rootVC: GKMainViewController())
        nav.gk_openScrollLeftPush = true
        
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

