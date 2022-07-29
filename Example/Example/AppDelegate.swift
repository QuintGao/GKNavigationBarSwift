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
        
        setupNavBar()
        setupWindow()
        
        return true
    }
    
    func setupNavBar() {
        GKConfigure.setupCustom {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: GK_SCREEN_WIDTH, height: GKDevice.statusBarNavBarHeight()))
            // 导航栏背景图片
            $0.backgroundImage = view.image(with: [UIColor(red: 127.0/255, green: 23.0/255, blue: 135.0/255, alpha: 1.0).cgColor, UIColor(red: 37.0/255, green: 26.0/255, blue: 188.0/255, alpha: 1.0).cgColor])
            // 导航栏暗黑模式下的背景图片
            $0.darkBackgroundImage = UIImage.gk_image(with: UIColor.lightGray)
            // 导航栏背景色
            $0.backgroundColor = .white
            // 导航栏标题颜色
            $0.titleColor = .white
            // 导航栏标题字体
            $0.titleFont = .systemFont(ofSize: 18)
            // 导航栏返回按钮样式
            $0.backStyle = .white
            // 状态栏样式
            $0.statusBarStyle = .lightContent
            // 导航栏左右item间距
            $0.gk_navItemLeftSpace = 0
            $0.gk_navItemRightSpace = 10
            // 是否恢复系统导航
            $0.gk_restoreSystemNavBar = true
            
            // 缩放配置
            $0.gk_translationX = 15
            $0.gk_translationY = 20
            $0.gk_scaleX = 0.90
            $0.gk_scaleY = 0.92
            
            // 开启全局UIScrollView处理
            $0.gk_openScrollViewGestureHandle = true
        }
    }
    
    func setupWindow () {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
    
        let nav = UINavigationController(rootVC: GKMainViewController())
        nav.gk_openScrollLeftPush = true
        nav.gk_openSystemNavHandle = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
}

