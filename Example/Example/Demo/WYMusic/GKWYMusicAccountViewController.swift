//
//  GKWYMusicAccountViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKWYMusicAccountViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitle = "账号"
        self.gk_navBackgroundColor = UIColor(red: 200/255.0, green: 39/255.0, blue: 39/255.0, alpha: 1.0)
        
        self.gk_navItemRightSpace = 20;
    }
}
