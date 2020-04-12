//
//  GKWYMusicFindViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKWYMusicFindViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navBackgroundColor = UIColor(red: 200/255.0, green: 39/255.0, blue: 39/255.0, alpha: 1.0)
        self.gk_navLeftBarButtonItem = UIBarButtonItem.gk_item(image: UIImage(named: "cm2_topbar_icn_playing"), target: self, action: #selector(hideTabBar))
        
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 250, height: 30)
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.placeholder = "搜索音乐、歌手、电台"
        self.gk_navTitleView = textField
        
        let pageImage = UIImageView(frame: CGRect(x: 0, y: GK_STATUSBAR_NAVBAR_HEIGHT, width: GK_SCREEN_WIDTH, height: GK_SCREEN_HEIGHT - GK_STATUSBAR_NAVBAR_HEIGHT - GK_TABBAR_HEIGHT))
        pageImage.image = UIImage(named: "discover_page")
        self.view.addSubview(pageImage)
        pageImage.isUserInteractionEnabled = true
        pageImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageAction)))
    }

    @objc func hideTabBar() {
        let detailVC = GKWYMusicDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func pageAction() {
        let detailVC = GKWYMusicDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
