//
//  GKWYNewsViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKWYNewsViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = false
        
        self.addChildVC(vc: GKWYNewsHomeViewController(), title: "首页", name: "Home")
        self.addChildVC(vc: GKWYNewsNewViewController(), title: "要闻", name: "Home")
        self.addChildVC(vc: GKWYNewsLiveViewController(), title: "直播", name: "Home")
        self.addChildVC(vc: GKWYNewsVideoViewController(), title: "视频", name: "Home")
        self.addChildVC(vc: GKWYNewsProfileViewController(), title: "我", name: "Home")
    }
    

    fileprivate func addChildVC(vc: UIViewController, title: String, name: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: name)
        vc.tabBarItem.selectedImage = UIImage(named: name + "_selected")
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 212/255.0, green: 25/255.0, blue: 37/255.0, alpha: 1.0)], for: .selected)
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        
        let nav = UINavigationController(rootVC: vc)
        nav.gk_openScrollLeftPush = true
        self.addChild(nav)
    }
}
