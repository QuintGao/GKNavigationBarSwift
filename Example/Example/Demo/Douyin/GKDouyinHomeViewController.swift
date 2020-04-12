//
//  GKDouyinHomeViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift
class GKDouyinScrollView: UIScrollView {
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.panBack(gesture: gestureRecognizer) {
            return false
        }
        return true
    }
    
    fileprivate func panBack(gesture: UIGestureRecognizer) -> Bool {
        if gesture == self.panGestureRecognizer {
            let point = self.panGestureRecognizer.translation(in: self)
            
            let state = gesture.state
            
            // 设置手势滑动的位置距屏幕左边的区域
            let locationDistance = UIScreen.main.bounds.size.width
            
            if state == .began || state == .possible {
                let location = gesture.location(in: self)
                if point.x > 0 && location.x < locationDistance && self.contentOffset.x <= 0 {
                    return true
                }
                
                // 临界点：scrollView滑动到最后一屏时的x轴的位置，可根据需求改变
                let criticalPoint = UIScreen.main.bounds.size.width
                
                // point.x < 0 代表左滑
                // 当UIScrollView滑动到临界点时，则不再响应UIScrollView的滑动手势，防止与左滑push功能冲突
                if point.x < 0 && self.contentOffset.x == criticalPoint {
                    return true
                }
                
            }
        }
        return false
    }
}

class GKDouyinHomeViewController: GKBaseViewController {

    lazy var scrollView: GKDouyinScrollView = {
        let scrollView = GKDouyinScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        return scrollView
    }()
    
    lazy var searchVC: GKDouyinSearchViewController = {
        return GKDouyinSearchViewController()
    }()
    
    lazy var playerVC: GKDouyinPlayerViewController = {
        return GKDouyinPlayerViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navBackgroundColor = UIColor.clear
        self.gk_statusBarHidden = true
        self.gk_navRightBarButtonItem = UIBarButtonItem.gk_item(title: "关闭", target: self, action: #selector(closeAction))
        
        self.scrollView.frame = self.view.bounds
        self.view .addSubview(self.scrollView)
        
        let childVC = [self.searchVC, self.playerVC]
        
        let w = self.view.frame.size.width
        let h = self.view.frame.size.height
        
        for (idx, vc) in childVC.enumerated() {
            self.addChild(vc)
            scrollView.addSubview(vc.view)
            
            vc.view.frame = CGRect(x: CGFloat(idx) * w, y: 0, width: w, height: h)
        }
        self.scrollView.contentSize = CGSize(width: CGFloat(childVC.count) * w, height: 0)
        
        // 默认显示播放器页
        self.scrollView.contentOffset = CGPoint(x: w, y: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.gk_pushDelegate = self
        self.gk_statusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.gk_pushDelegate = nil
        self.gk_statusBarHidden = false
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GKDouyinHomeViewController: GKViewControllerPushDelegate {
    func pushToNextViewController() {
        let personalVC = GKDouyinPersonalViewController()
        self.navigationController?.pushViewController(personalVC, animated: true)
    }
}
