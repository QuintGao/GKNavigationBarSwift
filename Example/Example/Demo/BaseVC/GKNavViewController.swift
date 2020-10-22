//
//  GKNavViewController.swift
//  Example
//
//  Created by gaokun on 2020/8/31.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self, name: GKViewControllerPropertyChanged, object: nil)
    }
}
