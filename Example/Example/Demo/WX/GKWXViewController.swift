//
//  GKWXViewController.swift
//  Example
//
//  Created by gaokun on 2020/10/26.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKWXViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildVC(vc: GKWXHomeViewController(), title: "微信", imageName: "Home")
        self.addChildVC(vc: GKWXFindViewController(), title: "发现", imageName: "Activity")
        self.addChildVC(vc: GKWXMineViewController(), title: "我的", imageName: "Mine")
    }
    
    func addChildVC(vc: UIViewController, title: String, imageName: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName.appending("_selected"))
        
        let nav = UINavigationController(rootVC: vc)
        self.addChild(nav)
    }
}
