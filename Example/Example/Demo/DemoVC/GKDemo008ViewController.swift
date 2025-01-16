//
//  GKDemo008ViewController.swift
//  Example
//
//  Created by QuintGao on 2025/1/16.
//  Copyright © 2025 QuintGao. All rights reserved.
//

import UIKit

class GKDemo008ViewController: GKBaseViewController {

    lazy var btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("App支持横屏", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(btn1Action), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("App不支持横屏", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(btn2Action), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gk_navTitle = "横屏播放器"
        
        view.addSubview(btn1)
        view.addSubview(btn2)
        
        btn1.snp.makeConstraints {
            $0.top.equalTo(self.gk_navigationBar.snp.bottom).offset(100)
            $0.centerX.equalTo(self.view)
        }
        
        btn1.snp.makeConstraints {
            $0.top.equalTo(self.btn1.snp.bottom).offset(50)
            $0.centerX.equalTo(self.view)
        }
    }
    
    deinit {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.isSupportLandscape = false
    }
    
    override var shouldAutorotate: Bool {
        false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    @objc func btn1Action() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.isSupportLandscape = true
        
        GKAVPlayerManager.shared.playVideo(from: self)
    }
    
    @objc func btn2Action() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.isSupportLandscape = false
        
        GKAVPlayerManager.shared.playVideo(from: self)
    }
}
