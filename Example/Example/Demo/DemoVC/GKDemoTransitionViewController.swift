//
//  GKDemoTransitionViewController.swift
//  Example
//
//  Created by gaokun on 2020/11/27.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKDemoTransitionViewController: GKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gk_navTitle = "自定义导航栏"
        self.gk_popDelegate = self
    }
}

extension GKDemoTransitionViewController: GKViewControllerPopDelegate {
    func viewControllerPopScrollBegan() {
        
    }
    
    func viewControllerPopScrollUpdate(progress: CGFloat) {
        // 由于已经出栈，所以self.navigationController为nil，不能直接获取导航控制器
        let vc = GKConfigure.visibleViewController()
        vc?.navigationController?.navigationBar.alpha = progress
    }
    
    func viewControllerPopScrollEnded(finished: Bool) {
        // 由于已经出栈，所以self.navigationController为nil，不能直接获取导航控制器
        let vc = GKConfigure.visibleViewController()
        vc?.navigationController?.isNavigationBarHidden = !finished;
        vc?.navigationController?.navigationBar.alpha = 1;
    }
}
