//
//  GKWYMusicViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKWYMusicViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = UIColor.black.withAlphaComponent(0.5)
        self.tabBar.isTranslucent = false
        
        self.addChildVC(vc: GKWYMusicFindViewController(), title: "发现音乐", name: "discovery")
        self.addChildVC(vc: GKWYMusicMineViewController(), title: "我的音乐", name: "music")
        self.addChildVC(vc: GKWYMusicFriendViewController(), title: "朋友", name: "friend")
        self.addChildVC(vc: GKWYMusicAccountViewController(), title: "账号", name: "account")
    }
    
    func addChildVC(vc: UIViewController, title: String, name: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: "cm2_btm_icn_"+name)
        vc.tabBarItem.selectedImage = UIImage(named: "cm2_btm_icn_"+name+"_prs")
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        let nav = UINavigationController(rootVC: vc)
        self.addChild(nav)
    }
}
