//
//  GKWXDetailViewController.swift
//  Example
//
//  Created by QuintGao on 2020/10/26.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKWXDetailViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.gk_navTitle = "详情"
        
        let showBtn = UIButton()
        showBtn.frame = CGRect(x: 100, y: 200, width: 100, height: 60)
        showBtn.backgroundColor = .black
        showBtn.setTitle("悬浮", for: .normal)
        showBtn.setTitleColor(.white, for: .normal)
        showBtn.addTarget(self, action: #selector(floatAction), for: .touchUpInside)
        self.view.addSubview(showBtn)
        
        let dismBtn = UIButton()
        dismBtn.frame = CGRect(x: 100, y: 300, width: 100, height: 60)
        dismBtn.backgroundColor = .black
        dismBtn.setTitle("取消", for: .normal)
        dismBtn.setTitleColor(.white, for: .normal)
        dismBtn.addTarget(self, action: #selector(dismAction), for: .touchUpInside)
        self.view.addSubview(dismBtn)
    }
    
    @objc func floatAction() {
        GKFloatView.create()
        GKFloatView.dismissVC()
    }
    
    @objc func dismAction() {
        GKFloatView.destory()
    }
}
