//
//  GKTabBaseViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/4.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKTabBaseViewController: GKBaseViewController {
    
    lazy var closeItem: UIBarButtonItem = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setTitle("关闭", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gk_navRightBarButtonItem = self.closeItem
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
