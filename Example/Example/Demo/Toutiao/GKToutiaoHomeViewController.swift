//
//  GKToutiaoHomeViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift
import JXSegmentedViewExt

class GKToutiaoHomeViewController: GKTabBaseViewController {

    lazy var dataSource: JXSegmentedTitleDataSource = {
        let dataSource = JXSegmentedTitleDataSource()
        dataSource.titles = ["关注", "推荐", "热点", "娱乐", "北京", "视频", "社会"]
        dataSource.titleNormalFont = .systemFont(ofSize: 15)
        dataSource.titleSelectedFont = .systemFont(ofSize: 16)
        dataSource.titleNormalColor = .black
        dataSource.titleSelectedColor = .red
        return dataSource
    }()
    
    lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView()
        segmentedView.dataSource = dataSource
        return segmentedView
    }()
    
    lazy var containerView: JXSegmentedListContainerView = {
        let containerView = JXSegmentedListContainerView(dataSource: self, type: .collectionView)
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitle = "首页"
        gk_navItemRightSpace = 0
        self.gk_navBackgroundColor = UIColor(red: 212/255.0, green: 25/255.0, blue: 37/255.0, alpha: 1.0)
        
        view.addSubview(segmentedView)
        view.addSubview(containerView)
        
        segmentedView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(gk_navigationBar.snp.bottom)
            $0.height.equalTo(40)
        }
        
        containerView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self.view)
            $0.top.equalTo(segmentedView.snp.bottom)
        }
        
        segmentedView.listContainer = containerView
        segmentedView.reloadData()
    }
    
    @objc func pageAction() {
        let detailVC = GKToutiaoDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension GKToutiaoHomeViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        dataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        GKDemo007ListViewController()
    }
}
