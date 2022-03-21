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
            let view = UIView(frame: CGRect(x: 0, y: 0, width: GK_SCREEN_WIDTH, height: GKDevice.statusBarNavBarHeight()))
            configure.backgroundImage = view.image(with: [UIColor(red: 127.0/255, green: 23.0/255, blue: 135.0/255, alpha: 1.0).cgColor, UIColor(red: 37.0/255, green: 26.0/255, blue: 188.0/255, alpha: 1.0).cgColor])
            configure.darkBackgroundImage = UIImage.gk_image(with: UIColor.lightGray)
            // 导航栏背景色
            configure.backgroundColor = UIColor.white
            // 导航栏标题颜色
            configure.titleColor = UIColor.black
            // 导航栏标题字体
            configure.titleFont = UIFont.systemFont(ofSize: 18.0)
            // 导航栏返回按钮样式
            configure.backStyle = .black
            // 导航栏左右item间距
            configure.gk_navItemLeftSpace = 0
            configure.gk_navItemRightSpace = 10.0
            configure.gk_restoreSystemNavBar = true
            // 缩放配置
            configure.gk_translationX = 15
            configure.gk_translationY = 20
            configure.gk_scaleX = 0.90
            configure.gk_scaleY = 0.92
            
            // 开启全局UIScrollView处理
            configure.gk_openScrollViewGestureHandle = true
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
    
        let nav = UINavigationController(rootVC: GKMainViewController())
//        nav.getMethodNames()
        nav.gk_openScrollLeftPush = true
        nav.gk_openSystemNavHandle = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

