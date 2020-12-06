//
//  GKWYNewsDetailViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKWYNewsDetailViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitle = "详情"
        self.gk_navTitleColor = .black
        self.gk_navBackgroundColor = .white
        self.gk_systemGestureHandleDisabled = true
        self.gk_pushDelegate = self
        
        let pageImage = UIImageView(frame: CGRect(x: 0, y: GK_STATUSBAR_NAVBAR_HEIGHT, width: GK_SCREEN_WIDTH, height: GK_SCREEN_HEIGHT - GK_STATUSBAR_NAVBAR_HEIGHT - GK_TABBAR_HEIGHT))
        pageImage.image = UIImage(named: "news_detailpage")
        self.view.addSubview(pageImage)
        pageImage.isUserInteractionEnabled = true
        pageImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageAction)))
    }
    
    @objc func pageAction() {
        let commentVC = GKWYNewsCommentViewController()
        commentVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(commentVC, animated: true)
    }
}

extension GKWYNewsDetailViewController: GKViewControllerPushDelegate {
    func pushToNextViewController() {
        pageAction()
    }
}
