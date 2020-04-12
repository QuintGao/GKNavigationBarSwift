//
//  GKBaseViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/3/31.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.modalPresentationStyle = .fullScreen
    }
    
    override var prefersStatusBarHidden: Bool {
        return self.gk_statusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.gk_statusBarStyle
    }
}
