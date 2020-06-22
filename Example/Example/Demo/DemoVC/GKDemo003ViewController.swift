//
//  GKDemo010ViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/4.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKDemo003ViewController: GKBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "系统导航"
        
        self.gk_navItemRightSpace = 20;
        let rightItem = UIBarButtonItem.gk_item(title: "跳转", target: self, action: #selector(click))
        rightItem.customView?.backgroundColor = .red
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func click() {
        let demoVC = GKDemo000ViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
}
