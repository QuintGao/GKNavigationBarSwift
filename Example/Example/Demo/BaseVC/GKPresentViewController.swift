//
//  GKPresentViewController.swift
//  Example
//
//  Created by QuintGao on 2022/9/16.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import UIKit

class GKPresentViewController: GKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        gk_navTitle = "presentVC"
        gk_navRightBarButtonItem = UIBarButtonItem.gk_item(title: "关闭", target: self, action: #selector(close))
        gk_navBackgroundColor = .blue
        gk_statusBarStyle = .lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(UIScreen.main.bounds)
        print(view.frame)
        print(navigationController?.navigationBar.frame ?? .zero)
    }
    
    @objc func close() {
        dismiss(animated: true)
    }
}
