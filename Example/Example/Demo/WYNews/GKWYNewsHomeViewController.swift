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
//        self.gk_navBackgroundColor = .black
        
        let pageImage = UIImageView(frame: CGRect(x: 0, y: UIDevice.statusBarNavBarHeight(), width: view.bounds.width, height: view.bounds.height - UIDevice.statusBarNavBarHeight() - UIDevice.tabBarHeight()))
        pageImage.image = UIImage(named: "news_homepage")
        self.view.addSubview(pageImage)
        pageImage.isUserInteractionEnabled = true
        pageImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageAction)))
        
        self.gk_pushDelegate = self
    }
    
    @objc func pageAction() {
        self.gk_pushTransition = GKPushAnimatedTransition(scale: false)
        
        let detailVC = GKWYNewsDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension GKWYNewsHomeViewController: GKViewControllerPushDelegate {
    func pushToNextViewController() {
        let detailVC = GKWYNewsDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
