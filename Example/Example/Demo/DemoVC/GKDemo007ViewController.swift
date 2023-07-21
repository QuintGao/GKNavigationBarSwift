//
//  GKDemo007ViewController.swift
//  Example
//
//  Created by QuintGao on 2022/7/29.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import UIKit
import JXSegmentedViewExt

class GKDemo007ViewController: GKBaseViewController {

    var dataSource = JXSegmentedTitleDataSource()
    
    lazy var segmentedView: JXSegmentedView = {
        dataSource.titles = ["关注", "推荐", "同城", "直播"]
        
        let segmentedView = JXSegmentedView()
        segmentedView.dataSource = dataSource
        
        let lineView = JXSegmentedIndicatorLineView()
        lineView.indicatorColor = .red
        segmentedView.indicators = [lineView]
        
        segmentedView.listContainer = containerView
        
        return segmentedView
    }()
    
    lazy var containerView: JXSegmentedListContainerView = {
        let containerView = JXSegmentedListContainerView(dataSource: self, type: .collectionView)
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gk_navTitle = "分类"
        gk_navItemRightSpace = 0
        gk_navRightBarButtonItem = UIBarButtonItem.gk_item(title: "更多", target: self, action: #selector(moreAction))
        
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
    }
                                                           
    @objc func moreAction() {
        
    }
}

extension GKDemo007ViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        dataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        GKDemo007ListViewController()
    }
}
