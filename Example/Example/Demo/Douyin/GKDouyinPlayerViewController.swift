//
//  GKDouyinPlayerViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKDouyinPlayerViewController: GKBaseViewController {

    override func loadView() {
        self.view = UIImageView(image: UIImage(named: "WechatIMG239"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_statusBarHidden = true
    }
}
