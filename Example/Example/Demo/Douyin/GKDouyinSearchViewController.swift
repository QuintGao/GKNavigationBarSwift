//
//  GKDouyinSearchViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKDouyinSearchViewController: GKBaseViewController {

    override func loadView() {
        self.view = UIImageView(image: UIImage(named: "WechatIMG240"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_statusBarHidden = true
    }
}
