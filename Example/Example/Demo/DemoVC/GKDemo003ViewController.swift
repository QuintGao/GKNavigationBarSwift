//
//  GKDemo010ViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/4.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKDemo003ViewController: GKBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "系统导航"
        
        gk_openFixNavItemSpace = true
        self.gk_navItemRightSpace = 40;
        let rightItem = UIBarButtonItem.gk_item(title: "push", target: self, action: #selector(click))
        rightItem.customView?.backgroundColor = .black
        self.navigationItem.rightBarButtonItem = rightItem
        
        self.gk_pushDelegate = self
        self.gk_popDelegate = self
    }
    
    @objc func click() {
        let demoVC = GKDemo000ViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationController?.isNavigationBarHidden = false
    }
}

extension GKDemo003ViewController: GKViewControllerPushDelegate {
    func pushToNextViewController() {
        let webVC = GKDemoTransitionViewController()
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func viewControllerPushScrollBegan() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func viewControllerPushScrollUpdate(progress: CGFloat) {
        self.navigationController?.navigationBar.alpha = 1 - progress
    }
    
    func viewControllerPushScrollEnded(finished: Bool) {
        self.navigationController?.navigationBar.alpha = 1
        self.navigationController?.isNavigationBarHidden = finished
    }
}

extension GKDemo003ViewController: GKViewControllerPopDelegate {
    func viewControllerPopScrollBegan() {
        
    }
    
    func viewControllerPopScrollUpdate(progress: CGFloat) {
        // 由于已经出栈，所以self.navigationController为nil，不能直接获取到导航控制器
        let vc = GKConfigure.visibleViewController()
        vc?.navigationController?.navigationBar.alpha = 1 - progress
    }
    
    func viewControllerPopScrollEnded(finished: Bool) {
        // 由于已经出栈，所以self.navigationController为nil，不能直接获取到导航控制器
        let vc = GKConfigure.visibleViewController()
        vc?.navigationController?.navigationBar.alpha = 1
        vc?.navigationController?.isNavigationBarHidden = finished
    }
}

extension GKDemo003ViewController {
    func navigationShouldPopOnClick() -> Bool {
        self.navigationController?.navigationBar.isHidden = true
        return true
    }
}
