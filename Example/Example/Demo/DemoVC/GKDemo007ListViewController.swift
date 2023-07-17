//
//  GKDemo007ListViewController.swift
//  Example
//
//  Created by QuintGao on 2022/7/29.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import UIKit
import JXSegmentedViewExt

class GKDemo007ListViewController: GKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        gk_navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0, alpha: 1.0)
    }
}

extension GKDemo007ListViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        view
    }
}
