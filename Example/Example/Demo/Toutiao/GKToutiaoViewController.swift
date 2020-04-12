//
//  GKToutiaoViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKToutiaoViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = false
        
        self.addChildVC(vc: GKToutiaoHomeViewController(), title: "首页", name: "Home")
        self.addChildVC(vc: GKToutiaoVideoViewController(), title: "视频", name: "Home")
        self.addChildVC(vc: GKToutiaoMicroViewController(), title: "微头条", name: "Home")
        self.addChildVC(vc: GKToutiaoMineViewController(), title: "我的", name: "Home")
    }
    

    fileprivate func addChildVC(vc: UIViewController, title: String, name: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: name)
        vc.tabBarItem.selectedImage = UIImage(named: name + "_selected")
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 212/255.0, green: 25/255.0, blue: 37/255.0, alpha: 1.0)], for: .selected)
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        
        let nav = UINavigationController(rootVC: vc, scale: true)
        self .addChild(nav)
    }
}
