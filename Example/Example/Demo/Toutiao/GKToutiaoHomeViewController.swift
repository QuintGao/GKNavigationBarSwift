//
//  GKToutiaoHomeViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKToutiaoHomeViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitle = "首页"
        self.gk_navBackgroundColor = UIColor(red: 212/255.0, green: 25/255.0, blue: 37/255.0, alpha: 1.0)
    
        let pageImage = UIImageView(frame: CGRect(x: 0, y: GKDevice.statusBarNavBarHeight(), width: GK_SCREEN_WIDTH, height: GK_SCREEN_HEIGHT - GKDevice.statusBarNavBarHeight() - GKDevice.tabBarHeight()))
        pageImage.image = UIImage(named: "home_page")
        self.view.addSubview(pageImage)
        pageImage.isUserInteractionEnabled = true
        pageImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageAction)))
    }
    
    @objc func pageAction() {
        let detailVC = GKToutiaoDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
