//
//  GKWYNewsHomeViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKWYNewsHomeViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitleView = UIImageView(image: UIImage(named: "news_titleView"))
        self.gk_statusBarStyle = .lightContent
        self.gk_navBackgroundColor = .black
        
        let pageImage = UIImageView(frame: CGRect(x: 0, y: GK_STATUSBAR_NAVBAR_HEIGHT, width: GK_SCREEN_WIDTH, height: GK_SCREEN_HEIGHT - GK_STATUSBAR_NAVBAR_HEIGHT - GK_TABBAR_HEIGHT))
        pageImage.image = UIImage(named: "news_homepage")
        self.view.addSubview(pageImage)
        pageImage.isUserInteractionEnabled = true
        pageImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageAction)))
    }
    
    @objc func pageAction() {
        let detailVC = GKWYNewsDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
