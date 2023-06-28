//
//  GKWYMusicMineViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKWYMusicMineViewController: GKTabBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gk_navTitle = "朋友"
        self.gk_navBackgroundColor = UIColor(red: 200/255.0, green: 39/255.0, blue: 39/255.0, alpha: 1.0)
        
        let pageImage = UIImageView(frame: CGRect(x: 0, y: GKDevice.statusBarNavBarHeight(), width: view.bounds.width, height: view.bounds.height - GKDevice.statusBarNavBarHeight() - GKDevice.tabBarHeight()))
        pageImage.image = UIImage(named: "music_page")
        self.view.addSubview(pageImage)
        pageImage.isUserInteractionEnabled = true
        pageImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageAction)))
    }
    
    @objc func pageAction() {
        let detailVC = GKWYMusicDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
