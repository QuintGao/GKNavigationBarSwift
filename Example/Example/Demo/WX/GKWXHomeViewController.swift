//
//  GKWXHomeViewController.swift
//  Example
//
//  Created by QuintGao on 2020/10/26.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKWXHomeViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gk_navTitle = "微信"
        
        let showBtn = UIButton()
        showBtn.frame =  CGRect(x: 100, y: 200, width: 100, height: 60)
        showBtn.backgroundColor = .black
        showBtn.setTitle("跳转", for: .normal)
        showBtn.setTitleColor(.white, for: .normal)
        showBtn.addTarget(self, action: #selector(showAction), for: .touchUpInside)
        self.view.addSubview(showBtn)
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        if let view = self.view.window {
            self.gk_captureImage = getCapture(with: view)
        }
    }
    
    
    @objc func showAction() {
        let detailVC = GKWXDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func getCapture(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
